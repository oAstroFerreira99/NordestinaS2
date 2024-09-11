$(document).ready(function () {
    const buttons = [];
    const submenus = [];
    var normalButtons = 0;

    var dynamicMenuActive = false;
    var goTitle; // Declare goTitle outside the functions to make it accessible to both functions

	
	document.onkeyup = function(data){
      
        if (!dynamicMenuActive) 
            openDynamicMenu();
          
		if (data["which"] == 27){
			for (i = 1; i <= normalButtons; ++i){
				$("#normalbutton-"+i).remove();
                $("#normalbutton-"+i).openDynamicMenu();
			}

			normalButtons = 0;
			$("button").remove();
			$("#goback").remove();
			buttons["length"] = 0;
			submenus["length"] = 0;
			$(".Container").html("");
			$(".newtitle").html();
            $("#normalbutton-" + i).fadeOut();
            $.post(closeDynamicMenu());
			$.post("http://dynamic/close");
		}
	}
    window.addEventListener("message", function (event) {
        var item = event.data;

        if (item.addbutton == true) {
            if (!item.id) {
                normalButtons = normalButtons + 1;
                var b = `<div id="normalbutton-${normalButtons}" data-trigger="${item.trigger}" data-parm="${item.par}" data-server="${item.server}" class="normalbutton ${item.title == "Guardar" ? "amarelo" : ""}"><div class="title">${item.title}</div><div class="description">${item.description}</div></div>`;
                $(".Container").append(b);
                buttons.push(b);
            } else {
                var b = `<button id="${item.id}" data-trigger="${item.trigger}" data-parm="${item.par}" data-server="${item.server}" class="a btn"><div class="title">${item.title}</div><div class="description">${item.description}</div></button>`;
                buttons.push(b);
            }
        } else if (item.addmenu == true) {
            var aa = `<button data-menu="${item.menuid}" class="b btn"><div class="title">${item.title}</div><div class="description">${item.description}</div><i class="fas fa-chevron-right" style="float:right;margin-top:-10%"></i></button>`;
            $(".Container").append(aa);
            submenus.push(aa);
        }

        if (item.close == true) {
            for (i = 1; i <= normalButtons; ++i) {
                $("#normalbutton-" + i).fadeOut();
            }

            normalButtons = 0;
            $("button").remove();
            $("#goback").remove();
            buttons.length = 0;
            submenus.length = 0;
            $(".Container").html("");

            $.post("http://dynamic/close");
            closeDynamicMenu(); // Chame a função para fechar o menu
        }

        if (item.show == true) {
            $(".Container").show();
        }
    });
    
    $("body").on("click", ".normalbutton", function () {
        $.post("http://dynamic/clicked", JSON.stringify({ trigger: $(this).attr("data-trigger"), param: $(this).attr("data-parm"), server: $(this).attr("data-server") }));
        $.post(closeDynamicMenu(false,false)); 
    });

    $("body").on("click", ".a", function () {
        $.post("http://dynamic/clicked", JSON.stringify({ trigger: $(this).attr("data-trigger"), param: $(this).attr("data-parm"), server: $(this).attr("data-server") }));
     });

    $("body").on("click", ".b",   function () {
        $(".b").remove();
        $(".a").remove();

        
        var goBack = `<div id="goback" class="normalbutton amarelo"><div class="title">Voltar</div><div class="description">Clique e volte nas opções anteriores</div></div>`;
        $(".Container").append(goBack).show();

        var menuid = $(this).attr("data-menu");
        for (i = 0; i < buttons.length; ++i) {
            var div = buttons[i];
            var match = div.match(`id="${menuid}"`);
            if (goTitle) {
                goTitle.remove();
            }
            if (match) {
                $(".Container").append(div);
                $(openDynamicMenu(true,true));
            }
        }
    });

    function updateDynamicMenu() {
        var containerPosition = $(".Container").offset();
        if (containerPosition && goTitle) {
            goTitle.style.top = containerPosition.top + "50px";
            goTitle.style.left = containerPosition.left + "10px";
        }
        if (!dynamicMenuActive) {
            openDynamicMenu();
        }
    }

    function toggleDynamicMenu() {
        if (!dynamicMenuActive) {
            openDynamicMenu();
        }
    }

    function openDynamicMenu() {
        dynamicMenuActive = true;

        goTitle = document.createElement("div");
        goTitle.id = "fixedtitle";
        goTitle.textContent = "Dynamic";
        document.body.appendChild(goTitle);

        var newTitleElement = document.querySelector(".newtitle");
        if (newTitleElement) {
            newTitleElement.style.display = newTitleElement.style.display === "none" ? "block" : "none";
        }
    }

    function closeDynamicMenu() {
        if (goTitle) {
            goTitle.remove();
        }

        var newTitleElement = document.querySelector(".newtitle");
        if (newTitleElement) {
            $(newTitleElement).unbind("click");
            newTitleElement.style.display = "block"; // Ajustado para exibir sempre o texto
        }

        $("body").off("click", ".normalbutton, .a, .b, [id=goback]", updateDynamicMenu);

        dynamicMenuActive = false;
    }
	$("body").on("click","[id=goback]",function(){
		$(".b").remove();
		$(".a").remove();
		$("button").remove();
		$("#goback").remove();
		$(".Container").append(submenus).show();
        $(openDynamicMenu(true,true));

		for (i = 1; i <= normalButtons; ++i){
			$("#normalbutton-"+i).show();
		}
	})});
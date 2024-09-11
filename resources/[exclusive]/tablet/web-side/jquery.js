var never = false;
var benMode = "Carros";
var selectPage = "benefactor";
var reversePage = "benefactor";
/* ---------------------------------------------------------------------------------------------------------------- */
$(document).ready(function(){
	window.addEventListener("message",function(event){
        if (never === false){
			benefactor("Carros");
			never = true
		}

		switch (event["data"]["action"]){
			case "openSystem":
				$("#actionmenu").css("display","block");
			break;

			case "closeSystem":
				$("#actionmenu").css("display","none");
			break;

            case "requestPossuidos":
				benefactor("Possuidos");
			break;

            case "requestCarros":
				benefactor("Carros");
			break;

            case "requestMotos":
				benefactor("Motos");
			break;

            case "requestAluguel":
				benefactor("Aluguel");
			break;
		};
	});

	document.onkeyup = function(data){
		if (data["which"] == 27){
			$.post("http://tablet/closeSystem");
        };
    };

    document.onkeydown = function(data){
        if (data["which"] == 68){
            $.post('http://tablet/rotate', JSON.stringify({key: "left"}))
        };
        if (data["which"] == 65){
            $.post('http://tablet/rotate', JSON.stringify({key: "right"}))
		};
	};
});
/* ---------------------------------------------------------------------------------------------------------------- */
$(document).on("click",".vehicle",function(){
	if (selectPage != reversePage){
		let isActive = $(this).hasClass("active");
		$(".vehicle").removeClass("active");
		if (!isActive){
			$(this).addClass("active");
			reversePage = selectPage;
		};
	};
});
/* ---------------------------------------------------------------------------------------------------------------- */
$(".rotationRight").on("click",function(){
	$.post('http://tablet/rotate', JSON.stringify({key: "right"}));
});

$(".rotationLeft").on("click",function(){
	$.post('http://tablet/rotate', JSON.stringify({key: "left"}))
});
/* ---------------------------------------------------------------------------------------------------------------- */
const benefactor = (mode) => {
	benMode = mode;
    selectPage = "benefactor";

	$("#categories").html(`
        <li id="button-category" class="fa-solid fa-car" data-id="Carros" ${mode == "Carros" ? "class=active":"Carros"}><label>Carros</label></li>
        <li  id="button-category" class="fa-solid fa-motorcycle" data-id="Motos" ${mode == "Motos" ? "class=active":"Motos"}><label>Motos</label></li>
        <li  id="button-category" class="fa-solid fa-circle-dollar-to-slot" data-id="Aluguel" ${mode == "Aluguel" ? "class=active":"Aluguel"}><label>Aluguel</label></li>
    `);

    $("#search").html(`
        <div class="section_content_search">
        ${mode == "Possuidos" ? '<input id="myInput" onkeyup="searchFunction()" placeholder="Procurar veículo...">':'<input id="myInput" onkeyup="searchFunction()" placeholder="Procurar veículo...">'}
            <i class="icon"><i class="fa-solid fa-magnifying-glass"></i></i>
        </div>
        <div id="contentVehicles">
            <div id="titleVehicles">${mode}</div>
        </div>
    `);

	$.post("http://tablet/request"+ mode,JSON.stringify({}),(data) => {
        var nameList = data["result"].sort((a,b) => (a["name"] > b["name"]) ? 1: -1);

		if (mode !== "Possuidos"){
            $('#buttons').html(`
                ${mode == "Aluguel" ? "<div id=\"benefactorRental\"><span>Alugar</span><small>veículo selecionado</small></div>":"<div id=\"benefactorBuy\"><span>Comprar</span><small>veículo selecionado</small></div>"}
                <div id="benefactorDrive"><span>Testar</span><small>veículo selecionado</small></div>
            `);

            $('#pageVehicles').html(`
                ${nameList.map((item) => (`
                    <div class="vehicle"  id="vehicle" data-type="${item["type"]}" data-name="${item["name"]}" data-key="${item["k"]}" data-price="${item["price"]}" data-icon="${item["icon"]}">
                        <div class="name-veh">
                            <span>${item["name"]}</span>
                        </div>

                        <div class="item-info">
                            <div class="contentVehicle">
                                <div class="value">
                                    ${item["mode"] == "gems" ? "<div class='iconveh'> <i class=\"fa-solid fa-gem\"></i> </div>":"<div class='iconveh'> <i class=\"fa-solid fa-dollar-sign\"></i> </div>"}
                                    <div class="newTitle">
                                        <small>Valor</small>
                                        <h1>${item["mode"] == "gems" ? format(item["price"])+"":""+format(item["price"])}</h1>
                                    </div>
                                </div>
                                <div class="malas">
                                    <div class="iconveh">
                                        <i class="fa-solid fa-truck-ramp-box"></i>
                                    </div>
                                    <div class="newTitle">
                                        <small>Malas</small>
                                        <h1>${item["chest"]}Kg</h1>
                                    </div>
                                </div>
                                <div class="tax">
                                    ${item["type"] == "rental" ? "":"<div class='iconveh'> <i class=\"fa-solid fa-chart-simple\"></i> </div>"}
                                    <div class="newTitle">
                                        ${item["type"] == "rental" ? "":"<small>Tx.Semanal</small>"}
                                        <h1>${item["type"] == "rental" ? "":item["tax"]}</h1>
                                    </div>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `)).join('')}
            `);

		} else {
            $('#buttons').html(`
                <div id="benefactorTransf"><span>Transferir</span><small>veículo selecionado</small></div>
                <div id="benefactorSell"><span>Vender</span><small>veículo selecionado</small></div>
            `);
            $('#pageVehicles').html(`
                ${nameList.map((item) => (`
                    <div class="vehicle" data-type="${item["type"]}" data-name="${item["name"]}" data-key="${item["k"]}">
                        <div class="name-veh">
                            <span>${item["name"]}</span>
                            <div class="renovar">
                                <span>${item["type"] == "rental" ? `<div id="benefactorRenovar" data-name="${item["k"]}">RENOVAR</div>`:""}</span>
                            </div>
                            <div class="pagar">
                                <span>${item["tax"] == "Atrasado" && item["type"] != "rental" ? `<div id="benefactorTax" data-name="${item["k"]}">PAGAR</div>`:""}</span>
                            </div>
                        </div>

                        <div class="item-info">
                            <div class="contentVehicle">
                                <div class="sellValue">
                                    ${item["type"] == "rental" ? "":"<div class='iconveh'> <i class=\"fa-solid fa-dollar-sign\"></i> </div>"}
                                    <div class="newTitle">
                                        ${item["type"] == "rental" ? "":"<small>Valor</small>"}
                                        <h1>${item["type"] == "rental" ? "":"$"+format(item["price"])}</h1>
                                    </div>
                                </div>
                                <div class="plate">
                                    <div class="iconveh">
                                        <i class="fa-regular fa-input-text"></i>
                                    </div>
                                    <div class="newTitle">
                                        <small>Placa</small>
                                        <h1>${item["plate"]}</h1>
                                    </div>
                                </div>
                                <div class="mensalTax">
                                    ${item["type"] == "rental" ? "":"<div class='iconveh'> <i class=\"fa-solid fa-chart-simple\"></i> </div>"}
                                    <div class="newTitle">
                                        ${item["type"] == "rental" ? "":"<small>Taxa</small>"}
                                        <h1>${item["type"] == "rental" ? "":item["tax"]}</h1>
                                    </div>
                                </div>
                                <div class="rental">
                                    ${item["type"] == "rental" ? "<div class='iconveh'> <i class=\"fa-solid fa-circle-dollar-to-slot\"></i> </div>":""}
                                    <div class="newTitle">
                                        ${item["type"] == "rental" ? "<small>Aluguel</small>":""}
                                        <h1>${item["type"] == "rental" ? item["rental"]:""}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `)).join('')}
            `);
		}
	});
};
/* ----------VEHICLE---------- */
$(document).on("click",".vehicle",function() {
	let $el = $(this);
	let isActive = $el.hasClass("active");
	$(".vehicle").removeClass("active");
	if(!isActive) $el.addClass("active");
});
/* ----------BENEFACTOR---------- */
$(document).on("click","#button-category",function(e){
	benefactor(e["target"]["dataset"]["id"]);
});
/* ----------BENEFACTORBUY---------- */
$(document).on("click","#benefactorBuy",function(e){
    let $el = $(".vehicle.active").attr("data-key");
	if($el){
        $.post("http://tablet/requestBuy",JSON.stringify({ name: $el }));
        $.post("http://tablet/closeSystem");
	}
});
/* ----------BENEFACTORRENTAL---------- */
$(document).on("click","#benefactorRental",function(e){
    let $el = $(".vehicle.active").attr("data-key");
	if($el){
        $.post("http://tablet/requestRental",JSON.stringify({ name: $el }));
        $.post("http://tablet/closeSystem");
	}
});
/* ----------BENEFACTORENOVAR---------- */
$(document).on("click","#benefactorRenovar",function(e){
    $.post("http://tablet/requestRenew",JSON.stringify({ name: e["target"]["dataset"]["name"] }));
    $.post("http://tablet/closeSystem");
});
/* ----------NAMEVEHICLE---------- */
$(document).on("click",".vehicle",function(e){
	let $el = $(".vehicle.active").attr("data-key");
	if($el){
		$.post("http://tablet/nameVehicle",JSON.stringify({ name: $el }));
	}
});
/* ----------BENEFACTORSELL---------- */
$(document).on("click","#benefactorSell",function(e){
    let $el = $(".vehicle.active").attr("data-key");
	if($el){
        $.post("http://tablet/requestSell",JSON.stringify({ name: $el }));
        $.post("http://tablet/closeSystem");
	}
});
/* ----------BENEFACTORTAX---------- */
$(document).on("click","#benefactorTax",function(e){
    $.post("http://tablet/requestTax",JSON.stringify({ name: e["target"]["dataset"]["name"] }));
    $.post("http://tablet/closeSystem");
});
/* ----------BENEFACTORTRANSF---------- */
$(document).on("click","#benefactorTransf",function(e){
	let $el = $(".vehicle.active").attr("data-key");
	if($el){
		$.post("http://tablet/requestTransf",JSON.stringify({ name: $el }));
		$.post("http://tablet/closeSystem");
	}
});
/* ----------BENEFACTORDRIVE---------- */
$(document).on("click","#benefactorDrive",function(e){
    let $el = $(".vehicle.active").attr("data-key");
	if($el){
        $.post("http://tablet/requestDrive",JSON.stringify({ name: $el }));
        $.post("http://tablet/closeSystem");
	}
});
/* ----------CLOSEBUTTON---------- */
$(document).on("click","#closeButton",function(){
    $.post("http://tablet/closeSystem");
});
/* ----------FORMAT---------- */
const format = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}
/* ----------SEARCHFUNCTION---------- */
function searchFunction() {
    var input = document.getElementById("myInput");
    var filter = input.value.toUpperCase();
    var ul = document.getElementById("pageVehicles");
    var li = ul.getElementsByClassName("vehicle");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("div")[0];
        txtValue = a["textContent"] || a["innerText"];
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i]["style"]["display"] = "";
        } else {
            li[i]["style"]["display"] = "none";
        }
    }
}
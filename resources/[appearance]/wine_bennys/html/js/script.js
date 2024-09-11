let vehiclemods = []
let tunning = []
let cartlist = []
let managertablet = false
let budgets = []
let helps = []
let picker;
let color = '#ffffff';
let damage = 0
let freecam = false
let inhelp = false

const defaults = {
    color: color,
    container: document.getElementById('color_picker'),
    onChange: function(color) {
        updateColor(color);
    },
    swatchColors: ['#D1BF91', '#60371E', '#A6341B', '#F9C743', '#C7C8C4'],
};

$(document).ready(function() {

    function playSound(sound, volume) {
        var audioPlayer = null;

        if (audioPlayer != null) {
            audioPlayer.pause();
        }

        audioPlayer = new Audio("./sounds/" + sound + ".ogg");
        audioPlayer.volume = volume;
        audioPlayer.play();
    }

    window.addEventListener("message", function(event) {
        let data = event.data;
        
        switch (data.action) {
            case "load":
                vehiclemods = data.vehiclemods;
                tunning = data.tunning;
                damage = data.damage;
                cartlist = []
              
                // console.log(JSON.stringify(tunning));
                loadMenu(vehiclemods);
				setSliderValues(tunning);
                loadDamage(damage);

                break;

            case "loadtablet":
                budgets = data.infos.budgets;
                helps = data.infos.helps;
                managertablet = data.manager;

                if (data.infos.announce != undefined) {
                    $(".painel .home .anuncio p").html(data.infos.announce);
                } else {
                    $(".painel .home .anuncio p").html("");
                }

                if (managertablet) {
                    $(".painel .home .anunciar").show();
                }

                var myuser = data.infos.myuser
                $(".painel .home .mecanico .mec .name").html(myuser.name);
                $(".painel .home .mecanico .mec .cargo").html(myuser.title);

                loadBudgets(budgets);
                loadHelps(helps);
                loadUsers(data.infos.users);
                break;
            case "loadplayer":
                vehiclemods = data.vehiclemods;
                cartlist = []

                loadMenu(vehiclemods);
                break;

            case "playSound":
                playSound(data.sound, data.volume);
                break;

            case "updateCart":
                cartlist = data.cartlist;
                $(".valores .valor").html(data.total);
                break;

            case "show":
                $(".valores .valor").html(0);
                $("body").show();
                break;

            case "showtablet":
                $(".painel").show();
                $(".lscustom").hide();
                $("body").show();
                break;

            case "showplayer":
                $(".painelplayer").show();
                $(".lscustom").hide();
                $("body").show();
                break;

            case "showhelp":
                inhelp = true;
                $(".painelchamado").show();
                $(".lscustom").hide();
                $("body").show();
                break;

            case "hide":
                $(".lscustom").fadeIn();
                $(".lscustom .modificacao").fadeIn();
                $(".lscustom .infos").fadeIn();
                $(".comprarcarrinho").fadeOut();
                $(".lscustom .options").fadeOut();
                $(".lscustom .cores #colorPicker").val("");
                $(".lscustom .cores").fadeOut();
                $("body").hide();
                break;

            case "hidetablet":
                $(".finalorcamento").fadeOut();
                $(".painel").hide();
                $(".lscustom").show();
                $("body").hide();
                break;

            case "hideplayer":
                $(".painelplayer").hide();
                $(".lscustom").show();
                $("body").hide();
                break;

            case "hidehelp":
                inhelp = false;
                $(".painelchamado").hide();
                $(".lscustom").show();
                $("body").hide();
                break;
        }
    });

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("https://" + GetParentResourceName() + "/close");
        }

        if (inhelp) return;

        if (data.which == 72) {
            freecam = !freecam
            if (freecam){
                $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: "freecam" }));
            }
        }

        if (data.which == 8) {
            if ($('.lscustom .options').is(':visible')) {
                $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: "reset" }));

                $(".lscustom .modificacao").fadeIn();
                $(".lscustom .infos").fadeIn();
                $(".lscustom .options").fadeOut();
                $(".lscustom .cores #colorPicker").val("");
                $(".lscustom .cores").fadeOut();
                $(".optionprice").html(0);
            }

            if ($('.lscustom .tunning').is(':visible')) {
				setSliderValues(tunning);
                $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: "reset" }));

                $(".lscustom .modificacao").fadeIn();
                $(".lscustom .infos").fadeIn();
                $(".lscustom .options").fadeOut();
                $(".lscustom .options .options_container").fadeIn();
                $(".lscustom .tunning").fadeOut();
            }
        }

        if (data.which == 67) {
            $(".comprarcarrinho .listaproduto").html("");
            var total = 0;
            $.each(cartlist, function(index, value) {
                total = total + value.price;
                var html = `<div class="produto">
                    <h3>${value.name}</h3>
                    <h3>${value.price}</h3>
                </div>`;
                $(".comprarcarrinho .listaproduto").append(html)
            });
            $(".comprarcarrinho .comprar h3").html("Comprar - R$ " + total);
            $(".lscustom").fadeOut();
            $(".comprarcarrinho").fadeIn();
        }
    };

    $('.painel .container--navigation .item--link').click(function() {
        var page = $(this).data("page");
        $('.painel .container--navigation .item--link').removeClass("active");
        $(this).addClass('active');

        $(".painel .servicos").hide();
        $(".painel ." + page).show();
    });

    $('.painelplayer .container--navigation .item--link').click(function() {
        var page = $(this).data("page");
        $('.painelplayer .container--navigation .item--link').removeClass("active");
        $(this).addClass('active');

        $(".painelplayer .page").hide();
        $(".painelplayer ." + page).show();
    });

    initPicker();
    updateColor(color);
});

$(document).on('click', '.lscustom .reparar .botao', function(e) {
    $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: "repair" }));
});

$(document).on('click', '.lscustom .modificacao .opcoes .opcao', function(e) {
    var index = $(this).data("index");
    var id = $(this).data("id");
    $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: id }));

    if (id == "color") {
        loadMenuColors(index, id);
    } else if (id == "wheel") {
        loadMenuWheel(index, id);
    } else if (id == "perfomance") {
        var total = vehiclemods[index].price
    
        if (vehiclemods[index].multiple) {
            total = total * index
        }

        $(".optionprice").html(total);
        $(".lscustom .tunning #save").attr("data-index", index).attr("data-id", id);
        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options .options_container").fadeOut();
        $(".lscustom .options").fadeIn();
        $(".lscustom .tunning").fadeIn();
    } else {
      
        loadOptions(index, id);
    }
});

$(document).on('click', '.lscustom .options .options_container .options_option', function(e) {
    var indexorig = $(this).data("indexorig");
    var index = $(this).data("index");
    var idorigi = $(this).data("idorigi");
    var id = $(this).data("id");

    if (vehiclemods[indexorig]) {

        if (idorigi == "color") {
            var indexcolor = $(this).data("indexcolor");
            var idcolor = $(this).data("idcolor");
            var colortype = $(this).data("colortype");
            var idcolortype = $(this).data("idcolortype");

            if (indexcolor == undefined && idcolor == undefined) {
                loadListColors(indexorig, idorigi, index, id);
            } else if (indexcolor != undefined && idcolor != undefined && colortype == undefined && idcolortype == undefined) {
                if (id == "custom") {
                    var total = vehiclemods[indexorig].menu[indexcolor].listcolors[index].price;

                    if (vehiclemods[indexorig].menu[indexcolor].listcolors[index].multiple) {
                        total = total * index
                    }

                    $(".optionprice").html(total);
                    $(".lscustom .cores").fadeIn();
                    $(".lscustom .cores #colorPicker").attr("data-action", "customcolor").attr("data-option", idcolor).attr("data-price", total);
                } else if (id == "pearly") {
                    loadPearly(indexorig, idorigi, indexcolor, idcolor, index, id);
                } else {
                    loadColors(indexorig, idorigi, indexcolor, idcolor, index, id);
                }
            } else {
                var total = vehiclemods[indexorig].menu[indexcolor].listcolors[colortype].price;

                if (vehiclemods[indexorig].menu[indexcolor].listcolors[colortype].multiple) {
                    total = total * index
                }

                $(".optionprice").html(total);

                if (idcolortype == "pearly"){
                    idorigi = "pearly"
                }

                $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: idorigi, colortype: idcolor, index: id, price: total }));
            }

        } else if (idorigi == "wheel") {
            var indexwheel = $(this).data("indexwheel");
            var idwheel = $(this).data("idwheel");
            var wheeltype = $(this).data("wheeltype");
            var idwheeltype = $(this).data("idwheeltype");

            if (indexwheel == undefined && idwheel == undefined) {
                loadSubmenuWheel(indexorig, idorigi, index, id);
            } else if (indexwheel != undefined && idwheel != undefined && wheeltype == undefined && idwheeltype == undefined) {
                if (id == "smoke-colors") {
                    var total = vehiclemods[indexorig].menu[indexwheel].list[index].price;

                    if (vehiclemods[indexorig].menu[indexwheel].list[index].multiple) {
                        total = total * index
                    }

                    $(".optionprice").html(total);
                    $(".lscustom .cores").fadeIn();
                    $(".lscustom .cores #colorPicker").attr("data-action", id).attr("data-option", idcolor).attr("data-price", total);
                } else {
                    if (id == "Traseira"){
                        $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: 24 }));
                    }
                    loadWheels(indexorig, idorigi, indexwheel, idwheel, index, id);
                }
            } else {
                if (idwheel == "accessories") {
                    var wheelid = vehiclemods[indexorig].menu[indexwheel].list[wheeltype].id;
                    var total = vehiclemods[indexorig].menu[indexwheel].list[wheeltype].price;

                    if (vehiclemods[indexorig].menu[indexwheel].list[wheeltype].multiple) {
                        total = total * index
                    }

                    $(".optionprice").html(total);

                    $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: idwheeltype, index: id, price: total }));
                } else if (idwheel == "wheeltype") {
                    var wheelid = vehiclemods[indexorig].menu[indexwheel].list[wheeltype].id;
                    var total = vehiclemods[indexorig].menu[indexwheel].list[wheeltype].price;

                    if (indexwheel == "wheelback" || indexwheel == "wheelfront"){
                        if (vehiclemods[indexorig].multiple) {
                            total = total * index
                        }
                    }else{
                        if (vehiclemods[indexorig].menu[indexwheel].list[wheeltype].multiple) {
                            total = total * index
                        }
                    }

                    $(".optionprice").html(total);

                    $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: idwheel, wheelid: wheelid, index: id, price: total }));
                }
            }

        } else {
            var typemod = vehiclemods[indexorig].id;
            var index = index;
            var total = vehiclemods[indexorig].price

            if ((vehiclemods[indexorig].actived + 1) != index) {
                if (vehiclemods[indexorig].multiple) {
                    total = total * index
                }

                $(".optionprice").html(total);
            } else {
                total = 0;
                $(".optionprice").html(0);
            }

            $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: typemod, index: index, price: total }));
        }

    }
});

$(document).on('change', '.lscustom .cores #colorPicker', function(e) {
    var option = $(this).attr("data-option");
    var action = $(this).attr("data-action");
    var price = parseInt($(this).attr("data-price"));
    var color = $(this).val();
    color = hexToRgb(color);
    $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: action, colortype: option, index: color, price: price }));
});

$(document).on('click', '.lscustom .cores button', function(e) {
    $(".lscustom .cores #colorPicker").val("");
    $(".lscustom .cores").fadeOut();
});

$(document).on('click', '.lscustom .opt .orcamento', function(e) {

    $(".comprarcarrinho .listaproduto").html("");
    var total = 0;
    $.each(cartlist, function(index, value) {
        total = total + value.price;
        var html = `<div class="produto">
            <h3>${value.name}</h3>
            <h3>${value.price}</h3>
        </div>`;
        $(".comprarcarrinho .listaproduto").append(html)
    });
    $(".comprarcarrinho .comprar h3").html("Comprar - R$ " + total);
    $(".lscustom").fadeOut();
    $(".comprarcarrinho").fadeIn();
});

$(document).on('click', '.comprarcarrinho .voltar', function(e) {
    $(".comprarcarrinho").fadeOut();
    $(".lscustom").fadeIn();
});

$(document).on('click', '.comprarcarrinho .comprar', function(e) {
    $.post("https://" + GetParentResourceName() + "/savemod");
});

$(document).on('click', '.painel .home .anunciar', function(e) {
    $(".painel .home .sendannounce input").toggle();
});

$(document).on('click', '.painel .home .baterponto', function(e) {
    $.post('http://' + GetParentResourceName() + '/servicestatus');
});

$(document).on('submit', '.sendannounce', function(e) {
    var message = $(".sendannounce input").val();

    $.post('http://' + GetParentResourceName() + '/addannounce', JSON.stringify({ message: message }));

    $(".sendannounce input").val("");
    $(".painel .home .sendannounce input").toggle();

    return false;
});

$(document).on('click', '.painel .budgets .orcamentos .orca .lista', function(e) {
    var index = $(this).data("index");
    var id = $(this).data("id");

    if (budgets[index]) {
        $(".finalorcamento .carrinho").html("");
        var total = 0;
        $.each(budgets[index].cartlist, function(index, value) {
            total = total + value.price;
            var html = `<div class="item">
                <h3>${value.name}</h3>
                <h3>${value.price}</h3>
            </div>`;
            $(".finalorcamento .carrinho").append(html)
        });
        $(".finalorcamento .botoes .finalizar").attr("data-id", id);
        $(".finalorcamento .total h3").html("Total: " + total);
        $(".painel").fadeOut();
        $(".finalorcamento").fadeIn();
    }
});

$(document).on('click', '.finalorcamento .botoes .voltar', function(e) {
    $(".finalorcamento").fadeOut();
    $(".painel").fadeIn();
});

$(document).on('click', '.finalorcamento .botoes .finalizar', function(e) {
    var id = $(this).attr("data-id");
    id = parseInt(id);
    $.post("https://" + GetParentResourceName() + "/applymod", JSON.stringify({ id: id }));
});

$(document).on('click', '.painel .helps .orcamentos .orca .lista', function(e) {
    var index = $(this).data("index");
    var id = $(this).data("id");
    id = parseInt(id);

    if (helps[index]) {
        $.post("https://" + GetParentResourceName() + "/accepthelp", JSON.stringify({ index: index, id: id }));
    }
});

$(document).on('change', '.painelplayer #suspensionchange', function(e) {
    var suspension = $(this).val();
    var type = "remove"

    if (suspension > 0 ){
        type = "add"
    }

    $.post("https://" + GetParentResourceName() + "/changesuspension", JSON.stringify({ index: suspension, type: type }));
});

$(document).on('change', '.painelplayer #offsetfrontchange', function(e) {
    var index = $(this).val();

    $.post("https://" + GetParentResourceName() + "/changeoffsetfront", JSON.stringify({ index: index }));
});

$(document).on('change', '.painelplayer #offsetrearchange', function(e) {
    var index = $(this).val();

    $.post("https://" + GetParentResourceName() + "/changeoffsetrear", JSON.stringify({ index: index }));
});

$(document).on('change', '.painelplayer #rotationfrontchange', function(e) {
    var index = $(this).val();

    $.post("https://" + GetParentResourceName() + "/changerotationfront", JSON.stringify({ index: index }));
});

$(document).on('change', '.painelplayer #rotationrearchange', function(e) {
    var index = $(this).val();

    $.post("https://" + GetParentResourceName() + "/changerotationrear", JSON.stringify({ index: index }));
});

$(document).on('click', '.lscustom .tunning #reset', function(e) {
    setSliderValues({ boost: 0.25, fuelmix: 1.3, braking: 0.5, drivetrain: 0.5, brakeforce: 1.4 });
});

$(document).on('click', '.lscustom .tunning #save', function(e) {
    var indexorig = $(this).attr("data-index");
    indexorig = parseInt(indexorig);
    
    var typemod = vehiclemods[indexorig].id;
    var index = getSliderValues();
    var total = vehiclemods[indexorig].price;

    if (vehiclemods[indexorig].multiple) {
        total = total * index
    }

    $.post("https://" + GetParentResourceName() + "/setmod", JSON.stringify({ type: typemod, index: index, price: total }));

    $.post("https://" + GetParentResourceName() + "/camera", JSON.stringify({ camera: "reset" }));

    $(".lscustom .modificacao").fadeIn();
    $(".lscustom .infos").fadeIn();
    $(".lscustom .options").fadeOut();
    $(".lscustom .options .options_container").fadeIn();
    $(".lscustom .tunning").fadeOut();
});

$(document).on('submit', '.sendhelp', function(e) {
    var message = $(".sendhelp textarea").val();

    $.post('http://' + GetParentResourceName() + '/sendhelp', JSON.stringify({ message: message }), function(data) {
        if(data){
            $(".sendhelp textarea").val("");
            $.post("https://" + GetParentResourceName() + "/close");
        }
    });

    return false;
});

function loadDamage() {
    
    if (damage >= 70){
        $(".lscustom .reparar").show();
    }else{
        $(".lscustom .reparar").hide();
    }
}

function loadMenu(data) {
    
    $(".lscustom .modificacao .opcoes").html("");
    $.each(data, function(index, value) {

        var actived = `style = "display: none;"`

        if (value.actived >= 0) {
            actived = "";
        }

        var html = `<div class="opcao tuning" data-index="${index}" data-id="${value.id}">
            <div class="instalado" ${actived}>
                <p class="install">Instalado</p>
            </div>
            <img src="img/parts/${value.id}.svg">
            <div class="nomemod">
                <h6 class="mod">${value.name}</h6>
            </div>
        </div>`;

        $(".lscustom .modificacao .opcoes").append(html);
    });
}

function loadOptions(index, id) {
    if (vehiclemods[index].maxmods > 0) {
        $(".lscustom .options .options_container").html("");

        for (let i = 0; i < vehiclemods[index].maxmods; i++) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${i}" data-indexorig="${index}" data-id="${id}">
                <div class="options_option_img">
                    <img src="img/parts/${id}.svg">
                </div>
                <div class="options_option_text">${i}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);
        }

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadMenuColors(index, id) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        $.each(vehiclemods[index].menu, function(indexarray, value) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${indexarray}" data-indexorig="${index}" data-id="${value.id}" data-idorigi="${id}">
                <div class="options_option_img">
                    <img src="img/parts/${value.id}.svg">
                </div>
                <div class="options_option_text">${value.category}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);

        });

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadListColors(index, id, indexcolor, idcolor) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        $.each(vehiclemods[index].menu[indexcolor].listcolors, function(indexarray, value) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${indexarray}" data-indexorig="${index}" data-indexcolor="${indexcolor}" data-id="${value.id}" data-idorigi="${id}" data-idcolor="${idcolor}">
                <div class="options_option_img">
                    <img src="img/parts/${idcolor}.svg">
                </div>
                <div class="options_option_text">${value.category}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);

        });

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadPearly(index, id, indexcolor, idcolor, colortype, idcolortype) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");


        for (let i = 0; i < 76; i++) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${i}" data-indexorig="${index}" data-indexcolor="${indexcolor}" 
            data-colortype="${colortype}" data-id="${i}" data-idorigi="${id}" data-idcolor="${idcolor}" data-idcolortype="${idcolortype}">
                <div class="options_option_img">
                    <img src="img/parts/${idcolor}.svg">
                </div>
                <div class="options_option_text">${i}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);
        }

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadColors(index, id, indexcolor, idcolor, colortype, idcolortype) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        $.each(vehiclemods[index].menu[indexcolor].listcolors[colortype].list, function(indexarray, value) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${indexarray}" data-indexorig="${index}" data-indexcolor="${indexcolor}" 
            data-colortype="${colortype}" data-id="${value}" data-idorigi="${id}" data-idcolor="${idcolor}" data-idcolortype="${idcolortype}">
                <div class="options_option_img">
                    <img src="img/parts/${idcolor}.svg">
                </div>
                <div class="options_option_text">${indexarray}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);

        });

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadMenuWheel(index, id) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        $.each(vehiclemods[index].menu, function(indexarray, value) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${indexarray}" data-indexorig="${index}" data-id="${value.id}" data-idorigi="${id}">
                <div class="options_option_img">
                    <img src="img/parts/${value.id}.svg">
                </div>
                <div class="options_option_text">${value.category}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);

        });

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadSubmenuWheel(index, id, indexwheel, idwheel) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        $.each(vehiclemods[index].menu[indexwheel].list, function(indexarray, value) {
            var newid = value.id;
            if (idwheel == "wheeltype") { newid = value.category }
            var html = `<div class="options_option" style="background: #fff;" data-index="${indexarray}" data-indexorig="${index}" data-indexwheel="${indexwheel}" data-id="${newid}" data-idorigi="${id}" data-idwheel="${idwheel}">
                <div class="options_option_img">
                    <img src="img/parts/${newid}.svg">
                </div>
                <div class="options_option_text">${value.category}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);

        });

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadWheels(index, id, indexwheel, idwheel, wheeltype, idwheeltype) {
    if (vehiclemods[index].menu) {
        $(".lscustom .options .options_container").html("");

        for (let i = 0; i < vehiclemods[index].menu[indexwheel].list[wheeltype].maxmods; i++) {
            var html = `<div class="options_option" style="background: #fff;" data-index="${i}" data-indexorig="${index}" data-indexwheel="${indexwheel}" 
            data-wheeltype="${wheeltype}" data-id="${i}" data-idorigi="${id}" data-idwheel="${idwheel}" data-idwheeltype="${idwheeltype}">
                <div class="options_option_img">
                    <img src="img/parts/${idwheeltype}.svg">
                </div>
                <div class="options_option_text">${i}</div>
            </div>`;
            $(".lscustom .options .options_container").append(html);
        }

        $(".lscustom .modificacao").fadeOut();
        $(".lscustom .infos").fadeOut();
        $(".lscustom .options").fadeIn();

    }
}

function loadBudgets(data) {
    $(".painel .budgets .orcamentos .orca").html("");
    var total = 0;
    $.each(data, function(index, value) {
        var statusclass = `pendente`
        var statusname = `Pendente`

        if (value.status == "finished") {
            statusclass = "realizado";
            statusname = "Realizado"
        } else if (value.status == "canceled") {
            statusclass = "cancelado";
            statusname = "Cancelado"
        } else if (value.status == "pending") {
            total = total + 1;
        }

        var html = `<div class="lista" data-index="${index}" data-id="${value.id}">
            <div class="opcao">
                <div class="nome">
                    <h6>${value.name} - ${value.phone} | ${value.vehicle} | ${value.plate}</h6>
                </div>
                <div class="valor">
                    <p class="valores">Valor:</p>
                    <p class="numeros">${value.price}</p>
                </div>
                <div class="${statusclass}">
                    <p>${statusname}</p>
                </div>
            </div>
        </div>`;

        $(".painel .budgets .orcamentos .orca").append(html);
    });

    if (total > 0) {
        $(".painel .budget-count").html(total);
        $(".painel .budget-count").show();
    } else {
        $(".painel .budget-count").hide();
    }
}

function loadHelps(data) {
    $(".painel .helps .orcamentos .orca").html("");
    $(".painel .chamados .todoschamados").html("");
    var total = 0;
    $.each(data, function(index, value) {
        var statusclass = `pendente`;
        var statusclass2 = `pendente`;
        var statusname = `Pendente`;

        if (value.status == "accepted") {
            statusclass = "realizado";
            statusclass2 = "aceito";
            statusname = "Aceito";
        } else if (value.status == "denied") {
            statusclass = "cancelado";
            statusclass2 = "negado";
            statusname = "Negado";
        } else if (value.status == "pending") {
            total = total + 1;
        }

        var html = `<div class="lista" data-index="${index}" data-id="${value.user_id}">
            <div class="opcao">
                <div class="nome" style="width: 20%;">
                    <h6>${value.name} - ${value.phone}</h6>
                </div>
                <div class="mensagem">
                    ${value.message}
                </div>
                <div class="${statusclass}">
                    <p>${statusname}</p>
                </div>
            </div>
        </div>`;

        $(".painel .helps .orcamentos .orca").append(html);

        var html = `<div class="chamado">
            <div class="nome">
                <h6>${value.name} - ${value.phone}</h6>
            </div>
            <div class="${statusclass}">
                <p>${statusname}</p>
            </div>
            <div class="desc">
                <p>${value.message}</p>
            </div>
        </div>`;
        $(".painel .chamados .todoschamados").append(html);
    });

    if (total > 0) {
        $(".painel .help-count").html(total);
        $(".painel .help-count").show();
    } else {
        $(".painel .help-count").hide();
    }
}

function loadUsers(data) {
    $(".painel .home .mecanico .lista").html("");
    var total = 0;
    var totals = 0;
    $.each(data, function(index, value) {
        total = total + 1;

        var statusclass = `foraservico`
        var statusname = `Fora de serviço`

        if (value.inservice) {
            totals = totals + 1
            statusclass = "emservico";
            statusname = "Em serviço"
        }
        var html = `<div class="mecanicos">
            <div class="nome">
                <h6>${value.name}</h6>
            </div>
            <div class="${statusclass}">
                <p>${statusname}</p>
            </div>
        </div>`;

        $(".painel .home .mecanico .lista").append(html);
    });

    $(".painel .home .mecanico .status .setstatus").html(totals + "/" + total);
}

function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

function initPicker(options) {
    options = Object.assign(defaults, options);
    picker = new EasyLogicColorPicker(options);
}

function updateColor(value) {
    color = value;
    const $color = document.querySelector('.sample__color');
    const $code = document.querySelector('.sample__code');
    $code.innerText = color;
    $color.style.setProperty('--color', color);

    var neoncolor = hexToRgb(color)

    $.post("https://" + GetParentResourceName() + "/changeneon", JSON.stringify({ color: neoncolor }));
}

function onChangeType(e) {
    picker.setType(e.value);
}

function setSliderValues(values){
    
    $(".styled-slider").each(function(){
        if(values[this.id] != null){
            var value = parseFloat(values[this.id]).toFixed(2)
            var out = "#"+this.id + "val";
           
            $(this).val(value);
            $(out).html(value);
        }
    });
}

function getSliderValues(){
    return {
        boost: $("#boost").val(),
        fuelmix: $("#fuelmix").val(),
        braking: $("#braking").val(),
        drivetrain: $("#drivetrain").val(),
        brakeforce: $("#brakeforce").val()
    };
}
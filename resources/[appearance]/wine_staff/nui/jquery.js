$(document).ready(function(){
	window.addEventListener("message",function(event){

		$(".searchitens").on("keyup", function () {
			let search = $(this).val().toLowerCase();
			$(".itens-overflow .nome-inventario").filter(function () {
			  $(this).closest(".item-inventario").toggle($(this).text().toLowerCase().indexOf(search) > -1)
			});
		});

		$(".searchgaragem").on("keyup", function () {
			let search = $(this).val().toLowerCase();
			$(".nome-garagem").filter(function () {
			  $(this).closest(".item-garagem").toggle($(this).text().toLowerCase().indexOf(search) > -1)
			});
		});

		$(".searchplayers").on("keyup", function () {
			let search = $(this).val().toLowerCase();
			$(".item-header").filter(function () {
			  $(this).closest(".item-controle").toggle($(this).text().toLowerCase().indexOf(search) > -1)
			});
		});

		$(".searchskins").on("keyup", function () {
			let search = $(this).val().toLowerCase();
			$(".nome-skin").filter(function () {
			  $(this).closest(".item-overflowskins").toggle($(this).text().toLowerCase().indexOf(search) > -1)
			});
		});

		$(".searchbausfac").on("keyup", function () {
			let search = $(this).val().toLowerCase();
			$(".item-header").filter(function () {
			  $(this).closest(".item-baus").toggle($(this).text().toLowerCase().indexOf(search) > -1)
			});
		});

		switch(event.data.action){
			case "showMenu":
				CloseAll()
				LimparInputs()
				Reload()

				$("#pagina-inicio").show();
				$("#players-online").html(event.data.players);
				$("#policia-online").html(event.data.police);
				$("#ilegal-online").html(event.data.hospital);
				$("#staff-online").html(event.data.staff);
				SetNomes(event.data.nome,event.data.sobrenome)
				$(".img-screenshot").attr(`src`,event.data.banner);
				$("#img1").attr(`src`,event.data.imagem);

				$("body").fadeIn(800);
			break;
		}
	});

	document.addEventListener("keydown",function(event) {
		if (event.key == "Escape"){
			
			$(".adicionar-teleportBox").fadeOut(500);
			$("body").fadeOut();	
			$(".butaoLado").removeClass("active");
    		$(`.butaoLado[data-pagina="inicio"]`).addClass("active");
			$.post("http://wine_staff/staffClose");
			
		}
	})

});

// ---------------------------------------
// -- Sistema de Teleport
// ---------------------------------------

function listTeleport(){
    $.post("http://wine_staff/CoordsLista",JSON.stringify({}),(data) => {
		let coordenadas = data.teleporteslista
		$('.telport-box-2').empty()
		coordenadas.forEach((key,value) => {
			$('.telport-box-2').prepend(`

				<div class="item-teleport">
					<div class="nome-teleort" onclick="teleportPlayer(this)" data-index="${key.nome}" data-x="${key.coord.x}" data-y="${key.coord.y}" data-z = "${key.coord.z}"><i class="fas fa-angle-right" style="margin-right: 10px; font-size: 11px;"></i>${key.nome}</div>
					<i onclick="deleteTeleport(this)" data-id="${key.id}" data-nome="${key.nome}" class="fas fa-trash icontrash"></i>
				</div>

			`)
		});
    });
}

function createCoord(){
	let $el = $('.criar-teleport:hover');
	let nome = $("#nome-teleport-create").val();
	if($el.length) {
		$.post("http://wine_staff/addteleport",JSON.stringify({
			nome:nome
		}), (data) =>{ 
			if(data.retorno == 'done') {
				closeCoord()
				LimparInputs()
				Reload()
			} 
		});
	}
};



function openCoord(){
    $(".format").fadeIn(500);
	$(".adicionar-tp-resquest").fadeIn(500);
}

function closeCoord(){
    $(".format").fadeOut(500);
	$(".adicionar-tp-resquest").fadeOut(500);
}

function teleportPlayer(data) {
	$.post("https://wine_staff/teleport",JSON.stringify({name:data.dataset.index,x:data.dataset.x,y:data.dataset.y,z:data.dataset.z}))
}

function deleteTeleport(data) {
	$.post("https://wine_staff/deleteteleport",JSON.stringify({
		id : data.dataset.id,
		nome : data.dataset.nome,
	}), (data) => {
			LimparInputs()
			Reload()
		}
	)
}


// ---------------------------------------
// -- Sistema de Logs
// ---------------------------------------

function listLogs(){
    $.post("http://wine_staff/LogsLista",JSON.stringify({}),(data) => {
		let logs = data.logslista
		$('.logs-box2').empty()
		logs.forEach((key,value) => {
			$('.logs-box2').prepend(`

				<div class="item-logs">
					<div class="identificador" style="background: ${key.cor};"></div>
					<img src="${key.img}" alt="">
					<div class="nome">${key.nome} [${key.user_id}]</div>
					<div class="separador" style="background: ${key.cor};"></div>
					<div class="motivo">${key.motivo}</div>
				</div>

			`)
		});
    });
}

// ---------------------------------------
// -- Sistema de Controle
// ---------------------------------------

function listaControle(){
    $.post("http://wine_staff/ControleLista",JSON.stringify({}),(data) => {
		let usuarios = data.controlelista.sort((a,b) => (b.user_id > a.user_id) ? 1: -1);
		$('.box-controle').empty()
		usuarios.forEach((key,value) => {
			$("#player-sendo-verificado8").html(key.nome + "[" + key.user_id + "]");
			$('.box-controle').prepend(`

				<div class="item-controle">
					<div class="item-header" style="width: 8%;">${key.user_id}</div>
					<div class="item-header2">
						<img src="${key.foto}" alt="">
						<div class="nome-controle">${key.nome}</div>
					</div>

					<div class="item-header3">
						<div class="status">ONLINE</div>
					</div>

					<div class="item-header4">
						<i onclick="enviarIDPlayer(this)" data-passaporte="${key.user_id}" data-tipo="SADVS" data-nome="${key.nome}" class="far fa-hammer iconheader" style="margin-left: 38%;"></i>
						<i onclick="enviarIDPlayer(this)" data-passaporte="${key.user_id}" data-tipo="VERPERFIL" data-nome="${key.nome}" class="far fa-exclamation-circle iconheader"></i>
					</div>
				</div>

			`)
		});
    });
}


function closeAplicarPunicao() {
	$(".aplicar-punicao").fadeOut(500);
	$(".aplicar-ban").fadeOut(500);
	$(".format").fadeOut(500);
	$(".aplicar-tempban").fadeOut(500);
	$(".format").fadeOut(500);
	$(".aplicar-kick").fadeOut(500);
	$(".format").fadeOut(500);

	
}
 
function enviarIDPlayer(data) {
	if (data.dataset.passaporte !== '1' && data.dataset.passaporte !== '2' && data.dataset.passaporte !== '6' && data.dataset.passaporte !== '9') {
	  $("#nPlayer-VerPerfil").html(data.dataset.nome);
  
	  $.post("https://wine_staff/EnviarID", JSON.stringify({
		passaporte: data.dataset.passaporte,
		tipo: data.dataset.tipo
	  }), (data) => {

		if (data.tipo == "SADVS") {
		  $(".setarID2").show(0);
		  
		  $(".format").fadeIn(700);
		}
  
		if (data.tipo == "VERPERFIL") {
		  Sfechar();
  		
		  $("#nome-jogador").html(data.nome + " " + data.sobrenome);
		  $("#celular-jogador").html(data.celular);
		  $("#registro-jogador").html(data.registro);
  
		  $("#carteira-jogador").html(data.carteira + " $");
		  $("#banco-jogador").html(data.banco + " $");
		  $("#coins-jogador").html(data.coins);
		  $("#idade-jogador").html(data.idade);
  
		  if (data.emprego == false) { 
			$("#emprego-jogador").text('Desempregado');
		  } else {
			$("#emprego-jogador").text(data.emprego);
		  }
  
		  if (data.vip == false) {
			$("#vip-jogador").text('Sem Vip');
		  } else {
			$("#vip-jogador").text(data.vip);
		  }
  
		  $("#SetIdentidade-Banner").attr('src', data.banner);
		  $("#SetIdentidade-Img").attr('src', data.img);
  
		  $("#pagina-VerPerfil").fadeIn(700);
		}
	  });
	 }
  }

function closeViewInventory(){
	$(".format").fadeOut(500);
	$(".ver-inventario").fadeOut(500);
}

function closeViewGaragem(){
	$(".format").fadeOut(500);
	$(".ver-garagem").fadeOut(500);
}

function closeAviso(){
	$(".format").fadeOut(500);
	$(".criar-aviso").fadeOut(500);
}

function createAviso(){
	let $el = $('.criar-teleport:hover');
	let motivo = $("#aviso-input").val();
	if($el.length) {
		$.post("http://wine_staff/addAviso",JSON.stringify({
			motivo:motivo
		}), (data) =>{ 
			if(data.retorno == 'done') {
				closeAviso()
				LimparInputs()
				Reload()
			} 
		});
	}
};


// ---------------------------------------
// -- Lista de Punicoes
// ---------------------------------------

function PunicoesLista(){
    $.post("http://wine_staff/PunicoesLista",JSON.stringify({}),(data) => {
		let punicoes = data.punicoes.sort((a,b) => (a.id > b.id) ? 1: -1);
		$('.box-punicoes').empty()
		punicoes.forEach((key,value) => {
			$('.box-punicoes').prepend(`

				<div class="item-controle">

					<div class="item-header" style="width: 8%;">${key.user_id}</div>
					<div class="item-header2">
						<img src="${key.foto}" alt="">
						<div class="nome-controle">${key.nome}</div>
					</div>

					<div class="item-header3">
						<div class="status" style="background: ${key.background}; color: ${key.color};">${key.status} ${key.contagem}</div>
					</div>

					<div class="item-header4">
					<i onclick="enviarIDInv5(this)" data-passaporte="${key.user_id}" data-nome="${key.nome}" data-motivo="${key.motivo}" data-staff="${key.staff}" data-data="${key.data}" class="far fa-eye iconheader" style="margin-left: 40%;"></i>
					<i onclick="DeleteAdv(this)" data-passaporte="${key.user_id}" data-contagem="${key.contagem}" data-id="${key.id}" data-nome="${key.nome}" data-motivo="${key.motivo}" data-staff="${key.staff}" data-data="${key.data}" class="far fa-trash iconheader"></i>
					</div>

				</div>

			`)
		});
    });
}

function DeleteAdv(data) {
	$.post("https://wine_staff/DeleteAdv",JSON.stringify({
		passaporte : data.dataset.passaporte,
		ide : data.dataset.id,
		contagem: data.dataset.contagem
	}), (data) => {
			LimparInputs()
			Reload()
		}
	)
}

function closeVerMotivo(){
	$(".format").fadeOut(500);
	$(".ver-motivo-punicao").fadeOut(500);
}


// ---------------------------------------
// -- Lista de Itens
// ---------------------------------------

function ItensLista(){
    $.post("http://wine_staff/ItensLista",JSON.stringify({}),(data) => {
	
		let itens = data.itens.sort((a,b) => (b.name > a.name) ? 1: -1);
		$('.itens-overflow').empty()
		itens.forEach((key,value) => {
			$('.itens-overflow').prepend(`

				<div class="item-inventario" onclick="FormatConfirmItem(this)" data-item="${key.item}" data-name="${key.name}" data-index="${key.index}" data-linkinventario="${key.linkinventario}">
				<div class="nome-inventario">${key.name}</div>
				
					<img id="img-2" src="${key.linkinventario}/${key.index}.png" alt="">
					<div class="quantidade-item" style="color: transparent;">1x</div>
					<div class="barra1"></div>
				</div>

			`)
		});
    });
}

function FormatConfirmItem(data) {
	$("#itempegar-nome").html(data.dataset.name);
	$("#itempegar-img").attr(`src`,data.dataset.linkinventario + "/" + data.dataset.index + `.png` );
	$.post("https://wine_staff/enviarItem",JSON.stringify({
		item : data.dataset.item,
	}), (data) => {
			$(".format").fadeIn(500);
			$(".pegar-item").fadeIn(500);
		}
	)
}

function closePegarItem(){
	$(".format").fadeOut(500);
	$(".pegar-item").fadeOut(500);
}


function PegarItemConfirmar(){
	let $el = $('.criar-teleport:hover');
	let quantidade = $("#quantidadepegar").val();
	if($el.length) {
		$.post("http://wine_staff/pegarItemConfirm",JSON.stringify({
			quantidade:quantidade
		}), (data) =>{ 
			if(data.retorno == 'done') {
				closePegarItem()
				LimparInputs()
				Reload()
			} 
		});
	}
};

// ---------------------------------------
// -- Lista de Logs Anuncios
// ---------------------------------------

function AnunciosLogs(){
    $.post("http://wine_staff/AnunciosLogs",JSON.stringify({}),(data) => {
	
		let anunciosLogs = data.anunciosLogs.sort((a,b) => (a.id > b.id) ? 1: -1);
		$('.box-anuncios-list').empty()
		anunciosLogs.forEach((key,value) => {
			
			$('.box-anuncios-list').prepend(`

				<div class="item-anuncio">
					<div class="title-anuncio">Anuncio ${key.emprego} #${key.id} | ${key.data}</div>
					<div class="desc-anuncio">${key.mensagem}</div>
				</div>

			`)
			
		});
    });
}


// ---------------------------------------
// -- Lista de Punicoes
// ---------------------------------------

function GaragemLista(){
    $.post("http://wine_staff/garagemLista",JSON.stringify({}),(data) => {
	
		let garagem = data.garagem.sort((a,b) => (b.name > a.name) ? 1: -1);
		$('.garagem-overflow').empty()
		garagem.forEach((key,value) => {
			
			$('.garagem-overflow').prepend(`

				<div class="item-garagem" onclick="FormatConfirmGaragem(this)" data-name="${key.name}" data-index="${key.carro}" data-linkgaragem="${key.linkgaragem}">
				<div class="nome-garagem">${key.name}</div>
					<img id="img-2" src="${key.linkgaragem}/${key.carro}.png" alt="">
					<div class="quantidade-garagem" style="color: transparent;">1x</div>
					<div class="barra1"></div>
				</div>

			`)
			
		});
    });
}

function closePegarCarro(){
	$(".format").fadeOut(500);
	$(".pegar-carro").fadeOut(500);
}

function FormatConfirmGaragem(data) {
	$("#carropegar-nome").html(data.dataset.name);
	$("#carropegar-img").attr(`src`,data.dataset.linkgaragem + "/" + data.dataset.index + `.png` );
	$.post("https://wine_staff/enviarCarro",JSON.stringify({
		carro : data.dataset.index,
	}), (data) => {
			$(".format").fadeIn(500);
			$(".pegar-carro").fadeIn(500);
		}
	)
}

function PegarGaragemConfirmar(){
	let $el = $('.criar-teleport:hover');
	let passaporte = $("#passaporteGaragem").val();
	if($el.length) {
		$.post("http://wine_staff/pegarCarroConfirmar",JSON.stringify({
			passaporte:passaporte
		}), (data) =>{ 
			if(data.retorno == 'done') {
				closePegarCarro()
				LimparInputs()
				Reload()
			} 
		});
	}
};

// ---------------------------------------
// -- Lista de Punicoes
// ---------------------------------------

function AnunciosLista(){
    $.post("http://wine_staff/AnunciarLista",JSON.stringify({}),(data) => {
	
		let anuncios = data.anuncios.sort((a,b) => (b.name > a.name) ? 1: -1);
		$('.anuncios-lista').empty()
		anuncios.forEach((key,value) => {
			
			$('.anuncios-lista').prepend(`

				<div class="item-anuncio-fazer" onclick="EnviarAnuncioInformacoes(this)" data-name="${key.name}">${key.name}</div>

			`)
			
		});
    });
}

function EnviarAnuncioInformacoes(data) {
	$(".anuncios-lista").hide(0);
	$(".confirm-anuncio").fadeIn(500);
	$.post("https://wine_staff/enviarAnuncioInfo",JSON.stringify({
		nomeanuncio : data.dataset.name,
	}), (data) => {
			$(".format").fadeIn(500);
			$(".pegar-carro").fadeIn(500);
		}
	)
}

function ScriarAnuncio(){
	$(".confirm-anuncio").hide(0);
	$(".anuncios-lista").show(0);
	$(".format").fadeIn(500);
	$(".fazer-anuncio").fadeIn(500);
}

function closeAnuniosList(){
	$(".format").fadeOut(500);
	$(".fazer-anuncio").fadeOut(500);
}

function FazerAnuncioAll(){
	let $el = $('.criar-teleport:hover');
	let textoAnuncio = $("#anuncioText").val();
	if($el.length) {
		$.post("http://wine_staff/fazeranuncioall",JSON.stringify({
			textoAnuncio:textoAnuncio
		}), (data) =>{ 
			if(data.retorno == 'done') {
				closeAnuniosList()
				LimparInputs()
				Reload()
			} 
		});
	}
};

// ---------------------------------------
// -- Editar Usuario
// ---------------------------------------

function editarIdentidade(tipo){

	// if(tipo == "trocar-nome"){
	// 	$(".trocar-nome").show(0);
	// }

	// if(tipo == "trocar-carteira"){
	// 	$(".trocar-carteira").show(0);
	// }

	// if(tipo == "trocar-banco"){
	// 	$(".trocar-banco").show(0);
	// }

	// if(tipo == "trocar-celular"){
	// 	$(".trocar-celular").show(0);
	// }

	// if(tipo == "trocar-registro"){
	// 	$(".trocar-registro").show(0);
	// }

	if(tipo == "listaskins"){
		$(".lista-skin").show(0);
		$(".format").fadeIn(700);
	}

	if(tipo == "enviarmensagem"){
		$(".enviar-mensagem").show(0);
		$(".format").fadeIn(700);
	}

}

function closeTrocar(tipo){
    $(".format").fadeOut(500);

	if(tipo == "nome"){
		$(".trocar-nome").fadeOut(500);
	}

	if(tipo == "carteira"){
		$(".trocar-carteira").fadeOut(500);
	}

	if(tipo == "banco"){
		$(".trocar-banco").fadeOut(500);
	}

	if(tipo == "celular"){
		$(".trocar-celular").fadeOut(500);
	}

	if(tipo == "registro"){
		$(".trocar-registro").fadeOut(500);
	}

	if(tipo == "screenshot"){
		$(".ver-screenshot").fadeOut(500);
		$(".img-screenshot").attr(`src`,"https://media.discordapp.net/attachments/452891038349262849/1032723940533088336/loading-93.gif");
	}

	if(tipo == "enviarmensagem"){
		$(".enviar-mensagem").fadeOut(500);
	}

	if(tipo == "listaskins"){
		$(".lista-skin").fadeOut(500);
	}

}

function TrocarNome(){
	let $el = $('.criar-teleport:hover');
	let PrimeiroNome = $("#nome-novo").val();
	let SegundoNome = $("#nome-novo2").val();
	if($el.length) {
		$.post("http://wine_staff/trocarnome",JSON.stringify({
			PrimeiroNome:PrimeiroNome,
			SegundoNome:SegundoNome
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".trocar-nome").hide(0);
				$("#nome-jogador").html(data.nome + " " + data.sobrenome);
				SetNomes(data.nome2,data.sobrenome2)
				LimparInputs()
				Reload()
			} 
		});
	}
};

$(document).on('click','.trocar-carteira .select-carteira',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	if (isActive) return;
	$('.trocar-carteira .select-carteira').removeClass('active');
    if(!isActive) $el.addClass('active');
});

function TrocarCarteira(){
	let $el = $('.trocar-carteira .select-carteira.active');
	let valor = $("#carteira-novo").val();
	if($el.length) {
		$.post("http://wine_staff/trocarcarteira",JSON.stringify({
			valor:valor,
			tipo: $el.attr('data-tipo')
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".trocar-carteira").hide(0);
				$("#carteira-jogador").html(data.carteira + " $");
				$('.trocar-carteira .select-carteira').removeClass('active');
				LimparInputs()
				Reload()
			} 
		});
	}
};

$(document).on('click','.trocar-banco .select-carteira',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	if (isActive) return;
	$('.trocar-banco .select-carteira').removeClass('active');
    if(!isActive) $el.addClass('active');
});

function TrocarBanco(){
	let $el = $('.trocar-banco .select-carteira.active');
	let valor = $("#banco-novo").val();
	if($el.length) {
		console.log('teste')
		$.post("http://wine_staff/trocarbanco",JSON.stringify({
			valor:valor,
			tipo: $el.attr('data-tipo')
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".trocar-banco").hide(0);
				$("#banco-jogador").html(data.banco + " $");
				$('.trocar-banco .select-carteira').removeClass('active');
				LimparInputs()
				Reload()
			} 
		});
	}
};

function TrocarCelular(){
	let $el = $('.criar-teleport:hover');
	let celularnovo = $("#celular-novo").val();
	if($el.length) {
		$.post("http://wine_staff/trocarcelular",JSON.stringify({
			celularnovo:celularnovo,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".trocar-celular").hide(0);
				$("#celular-jogador").html(data.celular);
				LimparInputs()
				Reload()
			} 
		});
	}
};


function TrocarRegistro(){
	let $el = $('.criar-teleport:hover');
	let registronovo = $("#registro-novo").val();
	if($el.length) {
		$.post("http://wine_staff/trocarregistro",JSON.stringify({
			registronovo:registronovo,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".trocar-registro").hide(0);
				$("#registro-jogador").html(data.registro);
				LimparInputs()
				Reload()
			} 
		});
	}
};




// ---------------------------------------
// -- SISTEMA
// ---------------------------------------

function Reload(){
	listTeleport()
	listLogs()
	listaControle()
	PunicoesLista()
	ItensLista()
	GaragemLista()
	AnunciosLista()
	AnunciosLogs()
	ListaSkins()
	ListaBausfac()
	verGrousList()
}

function CloseAll(){
	$(".format").hide();
	$(".aplicar-punicao").hide();
	$(".adicionar-tp-resquest").hide();
	$(".ver-inventario").hide();
	$(".ver-garagem").hide();
	$(".aplicar-punicao").hide();
	$(".criar-aviso").hide();
	$(".configuracao-usuario").hide();;
	$(".ver-motivo-punicao").hide();
	$(".pegar-item").hide();
	$(".pegar-carro").hide();
	$(".fazer-anuncio").hide();
	$(".ver-baucasas").hide();
	$(".ver-casas").hide();
	$(".ver-addempregos").hide();
	$(".ver-empregos").hide();
	$("#pagina-controle").hide();
	$("#pagina-punicoes").hide();
	$("#pagina-pegarItens").hide();
	$("#pagina-SetCarros").hide();
	$("#pagina-Anuncios").hide();
	$("#pagina-VerPerfil").hide();
	$(".setarID").hide();
	$(".trocar-nome").hide();
	$(".trocar-celular").hide();
	$(".trocar-registro").hide();
	$(".trocar-carteira").hide();
	$(".trocar-banco").hide();
	$(".ver-baufac").hide();
	$("#pagina-Baus").hide();
	$("#pagina-gerenciar").hide();
	$(".ver-groups").hide();
}

function LimparInputs(){
	$("#passaporteGaragem").val('');
	$("#anuncioText").val('');
	$("#nome-teleport-create").val('');
	$('#motivo-punicao').val('');
	$("#motivo-kick").val('');
	$("#motivo-advertencia").val('');
	$("#aviso-input").val('');
	$("#quantidadepegar").val('');
	$("#inf-punicao1").val('');
	$("#inf-punicao2").val('');
	$("#inf-punicao3").val('');
	$("#anuncioText").val('');
	$("#nome-novo").val('');
	$("#nome-novo2").val('');
	$("#emprego-novo").val('');
	$("#vip-novo").val('');
	$("#celular-novo").val('');
	$("#registro-novo").val('');
	$("#carteira-novo").val('');
	$("#banco-novo").val('');
	$("#idDiscord").val('');
	$("#celular-novo").val('');
	$("#registro-novo").val('');
	$("#banco-novo").val('');
	$("#carteira-novo").val('');
	$("#nome-novo").val('');
	$("#nome-novo2").val('');
	$(".searchgaragem").val('');
	$(".searchitens").val('');
	$(".searchplayers").val('');
	$(".searchskins").val('');
	$(".searchbausfac").val('');
	$(".searchgerenciar").val('');
	$("#mensagemenviada").val('');
}

function closeFormat(){
	$(".format").fadeOut(500);
	$(".aplicar-punicao").fadeOut(500);
	$(".adicionar-tp-resquest").fadeOut(500);
	$(".ver-inventario").fadeOut(500);
	$(".ver-garagem").fadeOut(500);
	$(".aplicar-punicao").fadeOut(500);
	$(".criar-aviso").fadeOut(500);
	$(".configuracao-usuario").fadeOut(500);
	$(".ver-motivo-punicao").fadeOut(500);
	$(".pegar-item").fadeOut(500);
	$(".pegar-carro").fadeOut(500);
	$(".fazer-anuncio").fadeOut(500);
}

function Sfechar(){
	$("#pagina-inicio").fadeOut(300);
	$("#pagina-controle").fadeOut(300);
	$("#pagina-punicoes").fadeOut(300);
	$("#pagina-pegarItens").fadeOut(300);
	$("#pagina-SetCarros").fadeOut(300);
	$("#pagina-Anuncios").fadeOut(300);
	$("#pagina-VerPerfil").fadeOut(300);
	$("#pagina-Baus").fadeOut(300);
	$("#pagina-gerenciar").fadeOut(300);

}

function SetNomes(primeiro,segundo){
	$("#name1").html(primeiro + " " + segundo);
	$("#name2").html(primeiro + " " + segundo);
	$("#name2").html(primeiro + " " + segundo);
	$("#name3").html(primeiro + " " + segundo);
	$("#name4").html(primeiro + " " + segundo);
	$("#name5").html(primeiro + " " + segundo);
	$("#name6").html(primeiro + " " + segundo);
	$("#name7").html(primeiro + " " + segundo);
	$("#name8").html(primeiro + " " + segundo);
	$("#name9").html(primeiro + " " + segundo);
	$("#name10").html(primeiro + " " + segundo);
	$("#name11").html(primeiro + " " + segundo);
	$("#name12").html(primeiro + " " + segundo);
	$("#name13").html(primeiro + " " + segundo);
	$("#name14").html(primeiro + " " + segundo);
	$("#name15").html(primeiro + " " + segundo);
	$("#name16").html(primeiro + " " + segundo);
	$("#name17").html(primeiro + " " + segundo);
	$("#name18").html(primeiro + " " + segundo);
	$("#name19").html(primeiro + " " + segundo);
	$("#name20").html(primeiro + " " + segundo);
	$("#name21").html(primeiro + " " + segundo);
	$("#name22").html(primeiro + " " + segundo);
	$("#name23").html(primeiro + " " + segundo);
	$("#name24").html(primeiro + " " + segundo);
	$("#name25").html(primeiro + " " + segundo);
	$("#name26").html(primeiro + " " + segundo);
	$("#name27").html(primeiro + " " + segundo);
	$("#name28").html(primeiro + " " + segundo);
	$("#name29").html(primeiro + " " + segundo);
	$("#name30").html(primeiro + " " + segundo);
}

function pagina(pagina){
	
	Sfechar()
	$(".butaoLado").removeClass("active");
    $(`.butaoLado[data-pagina="${pagina}"]`).addClass("active");
    $(`#pagina-${pagina}`).fadeIn(700);


}

// --------------------------------
// -- [ SISTEMA VER INVENTARIO ] --
// --------------------------------

function VerInventario(verify){
    $.post("http://wine_staff/PegarInv",JSON.stringify({}),(data) => {
		let inventario = data.inventario
		$('.inventario-box').empty()
		$('.ver-inventario').show(0)
		$('.format').fadeIn(700)

		if(verify =~ 'reload') {
			$('.ver-inventario').show(0)
			$('.format').fadeIn(700)
		}

		inventario.forEach((key,value) => {
			$("#player-sendo-verificado").html(key.nome + "[" + key.user_id + "]");
			

			const maxDurability = 86400 * key.days;
			const newDurability = (maxDurability - key.durability) / maxDurability;
			var actualPercent = newDurability * 100;

			if (actualPercent <= 1)
				actualPercent = 1;

			$('.inventario-box').prepend(`

				<div class="item-inventario">
					<div class="nome-inventario">${key.name}</div>
					<img src="${key.linkinventario}/${key.index}.png" alt="">
					<div class="quantidade-item">${key.amount}x</div>
					<div class="remove-inventario" onclick="removerItem(this)" data-item="${key.item}" data-quantidade="${key.amount}"><i class="fas fa-trash-alt"></i></div>
					<div class="barra1" style="background: ${actualPercent == 1 ? "#fc5858":colorPicker2(actualPercent)};">
						<div class="barra2" style="width: ${actualPercent == 1 ? "100":actualPercent}%; background: ${actualPercent == 1 ? "#fc5858":colorPicker(actualPercent)};"></div>
					</div>
				</div>

			`)
		});
    });
}

function removerItem(data){
	$.post("http://wine_staff/removerItem",JSON.stringify({
		item : data.dataset.item,
		quantidade : data.dataset.quantidade
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			VerInventario('reload')
		} 
	});
};

// --------------------------------
// -- [ SISTEMA VER GARAGEM ] --
// --------------------------------

function VerGaragem(verify){
    $.post("http://wine_staff/PegarGaragem",JSON.stringify({}),(data) => {
		let garagem = data.garagem

		if(verify =~ 'reload') {
			$('.ver-garagem').show(0)
			$('.format').fadeIn(700)
		}
		$('.garagem-box').empty()
		garagem.forEach((key,value) => {
			$("#player-sendo-verificado2").html(key.nome + "[" + key.user_id + "]");
			
			$('.garagem-box').prepend(`

				<div class="item-garagem">
					<div class="nome-garagem">${key.name}</div>
					<img src="${key.linkgaragem}/${key.index}.png" alt="">
					<div class="remove-casas" onclick="removerCarro(this)" data-item="${key.index}"><i class="fas fa-trash-alt"></i></div>
					<div class="bau-casas" onclick="verBauCarro(this)" data-carro="${key.index}"><i class="fas fa-treasure-chest"></i></div>
					<div class="barra1"></div>
				</div>
			
			`)
		});
    });
}

function removerCarro(data){
	$.post("http://wine_staff/removerCarro",JSON.stringify({
		item : data.dataset.item,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			VerGaragem('reload')
		} 
	});
};

function verBauCarro(data){
	$.post("http://wine_staff/verBauCarro",JSON.stringify({
		carro : data.dataset.carro,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$('.ver-garagem').hide(0)
			verBauCarroList()
		} 
	});
};

function verBauCarroList(verify){
    $.post("http://wine_staff/verBauCarroList",JSON.stringify({}),(data) => {
		let carroBau = data.carroBau

		if(verify =~ 'reload') {
			$('.ver-baucarro').show(0)
			$('.format').fadeIn(700)
		}

		$('.baucarro-box').empty()
		carroBau.forEach((key,value) => {
			$("#player-sendo-verificado3").html(key.nome + "[" + key.user_id + "]");
			const maxDurability = 86400 * key.days;
			const newDurability = (maxDurability - key.durability) / maxDurability;
			var actualPercent = newDurability * 100;

			if (actualPercent <= 1)
				actualPercent = 1;
			$('.baucarro-box').prepend(`

				<div class="item-baucarro">
					<div class="nome-baucarro">${key.name}</div>
					<img src="${key.linkinventario}/${key.index}.png" alt="">
					<div class="quantidade-item">${key.amount}x</div>
					<div class="remove-baucarro" onclick="removerItemBauCarro(this)" data-passaporte="${key.user_id}" data-item="${key.index}" data-slot="${key.item}" data-carro="${key.carro}"data-qtd="${key.amount}"><i class="fas fa-trash-alt"></i></div>
					<div class="barra1" style="background: ${actualPercent == 1 ? "#fc5858":colorPicker2(actualPercent)};">
						<div class="barra2" style="width: ${actualPercent == 1 ? "100":actualPercent}%; background: ${actualPercent == 1 ? "#fc5858":colorPicker(actualPercent)};"></div>
					</div>
				</div>
			
			`)
		});
    });
}

function removerItemBauCarro(data){
	$.post("http://wine_staff/removerItemBauCarro",JSON.stringify({
		passaporte : data.dataset.passaporte,
		item : data.dataset.item,
		slot : data.dataset.slot,
		carro : data.dataset.carro,
		quantidade : data.dataset.qtd,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verBauCarroList('reload')
		} 
	});
};

function closeViewBauCarro(){
	$(".format").fadeOut(500);
	$(".ver-garagem").hide(0);
	$(".ver-baucarro").fadeOut(500);
}

// --------------------------------
// -- [ SISTEMA VER CASAS  ] --
// --------------------------------

function VerCasas(verify){
    $.post("http://wine_staff/PegarCasas",JSON.stringify({}),(data) => {
		let casas = data.casas
		
		
		if(verify =~ 'reload') {
			$('.ver-casas').show(0)
			$('.format').fadeIn(700)
		}
		
		$('.casas-box').empty()
		casas.forEach((key,value) => {
			let img = `${data.imagem}${key.home}`;
			$("#player-sendo-verificado4").html(key.nome + "[" + key.user_id + "]");
			$('.casas-box').prepend(`

				<div class="item-casas">
					<div class="nome-casas">${key.home}</div>
					<img src="${img}.png" alt="">
					<div class="remove-casas" onclick="removerCasa(this)" data-casa="${key.home}"><i class="fas fa-trash-alt"></i></div>
					<div class="bau-casas" onclick="verBauCasa(this)" data-casa="${key.home}"><i class="fas fa-treasure-chest"></i></div>
					<div class="barra1"></div>
				</div>
			
			`)
		});
    });
}

function removerCasa(data){
	$.post("http://wine_staff/removerCasa",JSON.stringify({
		casa : data.dataset.casa,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			VerCasas('reload')
		} 
	});
};

function verBauCasa(data){
	$.post("http://wine_staff/verBauCasa",JSON.stringify({
		casa : data.dataset.casa,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$('.ver-casas').hide(0)
			verBauCasaList()
		} 
	});
};

function verBauCasaList(verify){
    $.post("http://wine_staff/verBauCasaList",JSON.stringify({}),(data) => {
		let casasBau = data.casasBau

		if(verify =~ 'reload') {
			$('.ver-baucasas').show(0)
			$('.format').fadeIn(700)
		}

		$('.baucasas-box').empty()
		casasBau.forEach((key,value) => {
			$("#player-sendo-verificado5").html(key.nome + "[" + key.user_id + "]");

			$('.baucasas-box').prepend(`

				<div class="item-baucasas">
					<div class="nome-baucasas">${key.name}</div>
					<img src="${key.linkinventario}/${key.index}.png" alt="">
					<div class="quantidade-item">${key.amount}x</div>
					<div class="remove-baucasas" onclick="removerItemBauCasa(this)" data-item="${key.index}" data-quantidade="${key.amount}"><i class="fas fa-trash-alt"></i></div>
					<div class="barra1"></div>
				</div>
			
			`)
		});
    });
}

function removerItemBauCasa(data){
	$.post("http://wine_staff/removerItemBauCasa",JSON.stringify({
		item : data.dataset.item,
		quantidade : data.dataset.quantidade,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verBauCasaList('reload')
		} 
	});
};

function closeViewCasa(){
	$(".format").fadeOut(500);
	$(".ver-casas").fadeOut(500);
}

function closeViewBauCasa(){
	$(".format").fadeOut(500);
	$(".ver-casas").hide(0);
	$(".ver-baucasas").fadeOut(500);
}

function closeViewGroups(){
	$(".format").fadeOut(500);
	$(".ver-groups").hide(0);
}

function closeViewBauFac(){
	$(".format").fadeOut(500);
	$(".ver-casas").hide(0);
	$(".ver-baufac").fadeOut(500);
}

// --------------------------------
// -- [ SISTEMA VER EMPREGOS  ] --
// --------------------------------

function setDiscordId(data){
	let id = $("#idDiscord").val();
	$.post("http://wine_staff/setDiscordId",JSON.stringify({
		id : id,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			VerEmpregos()
			$(".format").fadeOut(500);
			$(".setarID").fadeOut(500);
		} 
	});
};

function setDiscordId2(data){
	let id = $("#idDiscord2").val();
	$.post("http://wine_staff/setDiscordId",JSON.stringify({
		id : id,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$(".format").hide(0);
			$(".setarID2").hide(0);
			$(".banimento-box").hide(0);
			$(".kick-box").hide(0);
			$(".advertencia-box").hide(0);
			$(".escolha-box").show(0);
			$(".aplicar-punicao").show();
			$(".format").fadeIn(500);
		} 
	});
};

function VerEmpregos(verify){
    $.post("http://wine_staff/PegarEmpregos",JSON.stringify({}),(data) => {
		
		let empregos = data.empregos
		
		if(verify =~ 'reload') {
			$('.ver-empregos').show(0)
			$('.format').fadeIn(700)
		}

		$('.empregos-box').empty()
		empregos.forEach((key,value) => {
			$("#player-sendo-verificado6").html(key.nome + "[" + key.user_id + "]");
			console.log(JSON.stringify(key))
			$('.empregos-box').prepend(`
			

				<div class="item-empregos">
					<div class="nome-empregos">${key.empregotitle}</div>
					<div class="remove-empregos" onclick="removerCargo(this)" data-emprego="${key.emprego}"><i class="fas fa-user-times"></i></div>
					<div class="barra1"></div>
				</div>

			`)
		});
    });
}

function opendiscordid(){
	$(".setarID").show(0);
    $(".format").fadeIn(700);
}

function closediscordid(){
    $(".format").fadeOut(500);
	$(".setarID").fadeOut(500);
}

function closediscordid2(){
    $(".format").fadeOut(500);
	$(".setarID2").fadeOut(500);
}

function removerCargo(data){
	$.post("http://wine_staff/removerCargo",JSON.stringify({
		emprego : data.dataset.emprego,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			VerEmpregos('reload')
		} 
	});
};

function addemprego(data){
	$.post("http://wine_staff/addEmprego",JSON.stringify({}),(data) => {
		let addemprego = data.listEmprego

		$('.ver-empregos').hide(0)

		if(verify =~ 'reload') {
			$('.ver-addempregos').show(0)
			$('.format').fadeIn(700)
		}

		$('.addempregos-box').empty()
		addemprego.forEach((key,value) => {
			
			$('.addempregos-box').prepend(`

				<div class="item-addempregos">
					<div class="nome-addempregos">${key.empregotitle}</div>
					<div class="remove-addempregos" onclick="confirmarCargo(this)" data-emprego="${key.emprego}" data-tipo="${key.tipo}" data-iddc="${key.iddc}"><i class="fas fa-user-check"></i></div>
					<div class="barra1"></div>
				</div>

			`)
		});
    });
}

function confirmarCargo(data){
	$.post("http://wine_staff/confirmaremprego",JSON.stringify({
		emprego : data.dataset.emprego,
		tipo : data.dataset.tipo,
		iddc : data.dataset.iddc,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$('.ver-addempregos').hide()
			VerEmpregos()
		} 
	});
};

function closeViewEmpregos(){
	$(".format").fadeOut(500);
	$(".ver-empregos").hide(0);
}

function closeViewaddEmpregos(){
	$(".format").fadeOut(500);
	$(".ver-addempregos").hide(0);
}

// --------------------------------
// -- [ OPCOES RAPIDAS ] --
// --------------------------------

function opcoesRapidas(tipo){
	$.post("http://wine_staff/opcoesRapidas",JSON.stringify({
		tipo : tipo,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
		} 
	});
}

function screenshot(){
	$(".ver-screenshot").show(0);
	$(".format").fadeIn(700);
	$.post("http://wine_staff/screenshot",JSON.stringify({
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$(".img-screenshot").attr(`src`,data.imagem);
		} 
	});
}


function EnviarMensagem(tipo){
	let mensagem = $("#mensagemenviada").val();
	$.post("http://wine_staff/enviarMensagem",JSON.stringify({
		mensagem : mensagem,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$(".format").fadeOut(500);
			$(".enviar-mensagem").hide(0);
		} 
	});
}


// ---------------------------------------
// -- Lista de Skins
// ---------------------------------------

function ListaSkins(){
    $.post("http://wine_staff/skinsLista",JSON.stringify({}),(data) => {
	
		let skins = data.skins.sort((a,b) => (b.sexo > a.sexo) ? 1: -1);
		$('.overflowskins').empty()
		skins.forEach((key,value) => {
			
			$('.overflowskins').prepend(`

				<div class="item-overflowskins" onclick="setarSkin(this)" data-set="${key.set}">
					<div class="nome-skin detalhes">${key.nome}</div>
					<div class="set-skin">${key.set}</div>
					<img class="img-skin" src="${key.linkskins}/${key.set}.png" alt="">
				</div>

			`)
			
		});
    });
}

function setarSkin(data){
	$.post("http://wine_staff/setarSkin",JSON.stringify({
		set : data.dataset.set,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			$(".format").fadeOut(500);
			$(".lista-skin").hide(0);
		} 
	});
}

// ---------------------------------------
// -- Lista de Bau Fac
// ---------------------------------------

function ListaBausfac(){
    $.post("http://wine_staff/bausfacLista",JSON.stringify({}),(data) => {
		let bausfac = data.bausfac.sort((a,b) => (b.bau > a.bau) ? 1: -1);
		$('.box-baus').empty()
		bausfac.forEach((key,value) => {
			
			$('.box-baus').prepend(`

				<div class="item-baus">
					<div class="item-header" style="width: 38%;"><i class="fas fa-treasure-chest" style="margin-right: 10px;color: ${key.color}text-shadow: 0px 0px 30px ${key.color};"></i>Bau ${key.bau}</div>

					<div class="item-header3">
						<div class="status" style="color: ${key.color} background: ${key.background}">${key.tipo}</div>
					</div>

					<div class="item-header4">
						<i class="far fa-eye iconheader" onclick="verBauFac(this)" data-bau="${key.bau}" style="margin-left: 44%;"></i>
					</div>

				</div>

			`)
			
		});
    });
}

function verBauFac(data){
	$.post("http://wine_staff/RegisterBauFac",JSON.stringify({
		bau : data.dataset.bau,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verBauFacList()
		} 
	});
};

function verBauFacList(verify){
    $.post("http://wine_staff/verbausfacLista",JSON.stringify({}),(data) => {
		let verbausfac = data.verbausfac

		if(verify =~ 'reload') {
			$('.ver-baufac').show(0)
			$('.format').fadeIn(700)
		}

		$('.baufac-box').empty()
		verbausfac.forEach((key,value) => {
			
			$('.baufac-box').prepend(`

				<div class="item-baufac">
					<div class="nome-baufac">${key.name}</div>
					<img src="${key.linkinventario}/${key.index}.png" alt="">
					<div class="quantidade-item">${key.amount}x</div>
					<div class="remove-baufac" onclick="removerItemBauFac(this)" data-item="${key.item}" data-quantidade="${key.amount}"><i class="fas fa-trash-alt"></i></div>
					<div class="barra1"></div>
				</div>
			
			`)
		});
    });
}

function removerItemBauFac(data){
	$.post("http://wine_staff/removerItemBauFac",JSON.stringify({
		item : data.dataset.item,
		quantidade : data.dataset.quantidade,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verBauFacList('reload')
		} 
	});
};

// ---------------------------------------
// -- Lista de Groups
// ---------------------------------------

function verGrousList(verify){
    $.post("http://wine_staff/verGrousList",JSON.stringify({}),(data) => {
		let groups = data.groups
		$('.box-gerenciar').empty()
		groups.forEach((key,value) => {
			
			$('.box-gerenciar').prepend(`

				<div class="item-gerenciar">
					<div class="item-header" style="width: 38%;"><i class="fas fa-tag" style="margin-right: 10px;color: ${key.color}text-shadow: 0px 0px 30px ${key.color};"></i>${key.empresa}</div>

					<div class="item-header3">
						<div class="status" style="color: ${key.color} background: ${key.background}">${key.contador} ONLINE</div>
					</div>

					<div class="item-header4">
						<i class="far fa-users iconheader" onclick="RegisterGroup(this)" data-empresa="${key.empresa}" style="margin-left: 44%;"></i>
					</div>

				</div>
			
			`)
		});
    });
}

function RegisterGroup(data){
	$.post("http://wine_staff/RegisterGroup",JSON.stringify({
		empresa : data.dataset.empresa,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verPlayersGroup()
		} 
	});
};

function verPlayersGroup(verify){
    $.post("http://wine_staff/verPlayersGroup",JSON.stringify({}),(data) => {
		let verPlayersGroup = data.verPlayersGroup

		if(verify =~ 'reload') {
			$('.ver-groups').show(0)
			$('.format').fadeIn(700)
		}

		$('.groups-box').empty()
		verPlayersGroup.forEach((key,value) => {
			
			$('.groups-box').prepend(`

				<div class="item-groups">
					<div class="nome-groups">${key.nome} ${key.sobrenome} [${key.user_id}]</div>
					<div class="cargo-groups">${key.emprego}</div>
					<img class="img-groups" src="${key.img}" alt="">
					<div class="opcoes-div">
						<div class="opcoes-cargo upgrade" onclick="demitirGroups(this)" data-passaporte="${key.user_id}" data-tipo="upar" style="margin-left: -2%;"><i class="fas fa-angle-up"></i></div>
						<div class="opcoes-cargo downgrade" onclick="demitirGroups(this)" data-passaporte="${key.user_id}" data-tipo="rebaixar"><i class="fas fa-angle-down"></i></div>
						<div class="opcoes-cargo" onclick="demitirGroups(this)" data-passaporte="${key.user_id}" data-tipo="demitir"><i class="fas fa-times"></i></div>
					</div>
				</div>
			
			`)
		});
    });
}

function demitirGroups(data){
	$.post("http://wine_staff/demitirGroups",JSON.stringify({
		passaporte : data.dataset.passaporte,
		tipo : data.dataset.tipo,
	}), (data) =>{ 
		if(data.retorno == 'done') {
			LimparInputs()
			Reload()
			verPlayersGroup('reload')
		} 
	});
};



// ---------------------------------------
// -- SISTEMA ADVS  CRIAR POR COMPLETO

// ---------------------------------------

function paginaPunicao(pagina){

	$(".aplicar-punicao").fadeOut(300);

	if(pagina == "ban") {
		$(".aplicar-ban").fadeIn(300);
	}

	if(pagina == "temp-ban") {
		$(".aplicar-tempban").fadeIn(300);
	}

	if(pagina == "kick") {
		$(".aplicar-kick").fadeIn(300);
	}
	if(pagina == "adv") {
		$(".criar-aviso").fadeIn(300);
	}
}

function closePunicao(){
	$(".aplicar-ban").fadeOut(500);
	$(".format").fadeOut(500);
	$(".aplicar-tempban").fadeOut(500);
	$(".format").fadeOut(500);
	$(".aplicar-kick").fadeOut(500);
	$(".format").fadeOut(500);
	$(".aplicar-punicao").fadeOut(500);
	$(".escolha-box").hide(0);
			$(".aplicar-punicao").hide();
			$(".format").fadeOut(500);
}

function createBan(){
	let $el = $('.criar-teleport:hover');
	let motivo = $("#punicao-ban-input").val();
	if($el.length) {
		$.post("http://wine_staff/addBan",JSON.stringify({
			motivo:motivo
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".aplicar-ban").fadeOut(500);
				$(".format").fadeOut(500);
				LimparInputs()
				Reload()
			} 
		});
	}
};
function createTempBan(){
	let $el = $('.criar-teleport:hover');
	let motivo = $("#punicao-ban-input").val();
	if($el.length) {
		$.post("http://wine_staff/addTempBan",JSON.stringify({
			motivo:motivo
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".aplicar-ban").fadeOut(500);
				$(".format").fadeOut(500);
				LimparInputs()
				Reload()
			} 
		});
	}
};

function createKick(){
	let $el = $('.criar-teleport:hover');
	let motivo = $("#motivo-kick").val();
	if($el.length) {
		$.post("http://wine_staff/addKick",JSON.stringify({
			motivo:motivo
		}), (data) =>{ 
			if(data.retorno == 'done') {
				LimparInputs()
				Reload()
			} 
		});
	}
};

function createAdv(){
	let $el = $('.criar-teleport:hover');
	let motivo = $("#motivo-advertencia").val();
	if($el.length) {
		$.post("http://wine_staff/addAdv",JSON.stringify({
			motivo:motivo
		}), (data) =>{ 
			if(data.retorno == 'done') {
				LimparInputs()
				Reload()
			} 
		});
	}
};





const colorPicker = (percent) => {
	var colorPercent = "#43e943";

	if (percent >= 100)
		colorPercent = "rgba(255,255,255,0)";

	if (percent >= 51 && percent <= 75)
		colorPercent = "#43e943";

	if (percent >= 26 && percent <= 50)
		colorPercent = "#e9b543";

	if (percent <= 25)
		colorPercent = "#fd2e09";

	return colorPercent;
}

const colorPicker2 = (percent) => {
	var colorPercent = "rgba(15,15,15,0.8)";

	if (percent >= 100)
		colorPercent = "rgba(255,255,255,0)";

	if (percent >= 51 && percent <= 75)
		colorPercent = "rgba(15,15,15,0.8)";

	if (percent >= 26 && percent <= 50)
		colorPercent = "rgba(15,15,15,0.8)";

	if (percent <= 25)
		colorPercent = "rgba(15,15,15,0.8)";

	return colorPercent;
}
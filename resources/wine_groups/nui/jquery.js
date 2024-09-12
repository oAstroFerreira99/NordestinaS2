
var cargo_player_acessando = "nada"
var filtar_por = "id"
let nomeEmpresa, banco
$(document).ready(function(){
	window.addEventListener("message",function(event){

		$("#procurarpormembro").on("keyup", function () {
			if(filtar_por == "id"){
				let search = $(this).val().toLowerCase();
				$(".i-t-1-text").filter(function () {
				  $(this).closest("#item-contratado").toggle($(this).text().toLowerCase().indexOf(search) > -1)
				});	
			} else if(filtar_por == "nome") {
				let search = $(this).val().toLowerCase();
				$(".nome-ct").filter(function () {
				  $(this).closest("#item-contratado").toggle($(this).text().toLowerCase().indexOf(search) > -1)
				});	
			}
		});

		switch(event.data.action){
			case "showMenu":

				var item = event.data
			
				if(item.paginaUpgrades){
					$("#ConfigUpgrades").css('display','block');
				}else{
					$("#ConfigUpgrades").css('display','none');
				}

				$("#pagina-inicio").show(0);
				$("#pagina-membros").hide(0);
				$("#pagina-vendas").hide(0);
				$("#pagina-criarvenda").hide(0);
				$("#pagina-banco").hide(0);
				$(".filtar-options").hide(0);
				$(".format").hide(0);
				$(".format-contratar-box").hide(0);
				$(".format-ajuda-box").hide(0);
				$(".format-setarId-box").hide(0);
				$(".format-anuncio-box").hide(0);
			    $(".container .lado .BotaoLado").removeClass('active');
				$(".container .lado .BotaoLado:nth-child(1)").addClass('active');

				$(".ola-personagem").html("👋 Ola, " + item.nome);

				$("#Nome-Empresa").html(item.empresa);
				nomeEmpresa = item.empresa
				banco = item.banco
				$("#Membros-Empresa").html(item.Membros_Setados + "/" + item.Limite_Membros);
				$("#Vendas-Empresa").html(item.vendas);
				$("#Avisos-Empresa").html(item.avisos + "/" + "3");
				$("#banco-Empresa").html("$ " + item.banco);


				$(".imagem-usuario").attr(`src`,item.imagem);



				$(".aparecer-imagem").hide(0);
				$(".aparecer-imagem").attr(`src`,"inkimagem");
				$(".sumir-imagemvenda").show(0);

				cargo_player_acessando = item.cargo
				filter_nui = "fechado"

				refreshTables()
				limparInputs()
				FazerVerifyBotoes(item.cargo)

				$("#mensagens").animate({
                    scrollTop: $('#mensagens').get(0).scrollHeight
                }, 300);

				$("body").fadeIn(800);

			break;

			case "hideMenu":
				$("body").fadeOut();		
			break;
		}
		
	});

	document.onkeyup = function(data) {
		if (data.which == 27){
			$.post("http://wine_groups/close");
		}else if(data.key == "Enter"){
			if($("#chat-input").val() != "" && $("#chat-input").val() != " " ){
				enviarChat()
			}
		}
	};
});

function closeNui(){
	$.post("http://wine_groups/close");
}

// ----------------------------------------
// -- Funcoes Inicio
// ----------------------------------------

function TrocarPagina(pagina){
	$("#pagina-inicio").hide(0);
	$("#pagina-membros").hide(0);
	$("#pagina-vendas").hide(0);
	$("#pagina-banco").hide(0);
	$("#pagina-criarvenda").hide(0);

	if(pagina == 'inicio'){
		$("#pagina-inicio").fadeIn(500);
	}

	if(pagina == 'membros'){
		$("#pagina-membros").fadeIn(500);
	}

	if(pagina == 'vendas'){
		$("#pagina-vendas").fadeIn(500);
	}
	if(pagina == 'banco'){
		$("#pagina-banco").fadeIn(500);
	}
}

$(document).on("click", ".container .lado .BotaoLado", function () {
    $('.container .lado .BotaoLado').removeClass('active');
    $(this).addClass('active');
});

function abrirFilterMembros(){
	if(filter_nui == "aberto"){
		filter_nui = "fechado"
		$(".filtar-options").hide(0);
	}else{
		filter_nui = "aberto"
		$(".filtar-options").show(0);
	}
}

$(document).on("click", "#pagina-membros .filter-escolha", function () {
    $('#pagina-membros .filter-escolha').removeClass('activeFilter');
	$(this).addClass('activeFilter');
});

function setarFiltroMembros(tipo){
	$(".filtar-options").fadeOut(0);
	filtar_por = tipo
	filter_nui = "fechado"
}

function FazerVerifyBotoes(cargo){

	if(cargo == "Lider" || cargo == "Sub-Lider" || cargo == "Administrador" || cargo == "Chefe" || cargo == "Gerente"){
		$(".addanuncio-botao").show();
		$(".add-membro").show();
	} else if(cargo == "Gerente" || cargo == "Sub-Lider" || cargo == "Administrador") {
		$(".addanuncio-botao").show();
		$(".add-membro").show();
	}else{
		$(".addanuncio-botao").hide();
		$(".add-membro").hide();
	}
}

function AbrirFormat(pagina){

	if(pagina == "anuncio"){
		$(".format-anuncio-box").show();
	}

	$(".format").fadeIn(500);

}

function FecharFormat(pagina){
	$(".format").fadeOut(300);

	if(pagina == "anuncio"){
		$(".format-anuncio-box").hide();
	}

	if(pagina == "setardc"){
		$(".format-setarId-box").hide();
	}

	if(pagina == "contratar"){
		$(".format-contratar-box").hide();
	}

	if(pagina == "ajudadc"){
		$(".format-ajuda-box").hide();
	}

	if(pagina == "enviarimgvenda"){
		$(".format-enviarimgvenda-box").hide();
	}

	if(pagina == "verVenda"){
		$(".format-ver-venda").hide();
	}
	if(pagina == "depositar"){
		$(".format-depositar-box").hide();
	}
	if(pagina == "sacar"){
		$(".format-sacar-box").hide();
	}

}

function refreshTables(){
	listaAnuncios()
	listaChat()
	membrosLista()
	bauFac()
	ListaVendas()
	ListaBanco()
	$("#mensagens").animate({ scrollTop: 20000000 }, "slow");
}

function limparInputs(){
	$("#inputAnuncio").val('');
	$("#chat-input").val('');
	$("#passaporteContratar").val('');
	$("#inputdiscordid").val('');
	$("#compradorInput").val('');
	$("#procurarpormembro").val('');
	$("#compradorInput").val('');
}

function abrirAjuda(){
	$(".format-setarId-box").hide();
	$(".format-ajuda-box").fadeIn(500);
}

// ----------------------------------------
// -- Anuncios
// ----------------------------------------

function listaAnuncios(){
    $.post("http://wine_groups/anunciosLista",JSON.stringify({}),(data) => {
		let anunciosLista = data.anunciosLista.sort((a,b) => (a.id > b.id) ? 1: -1);
		$('.ConsultAnuncio-box').empty()
		anunciosLista.forEach((key,value) => {
			$('.ConsultAnuncio-box').prepend(`

			<div class="itemAnuncio">
				<div class="infos-anuncio-box">
					<div class="a-nomeplayer"><i class="fad fa-user-tag IconAnuncio"></i>${key.nome} <ss style="color: ${key.color};">#${key.passaporte}</ss></div>
					<div class="a-data"><i class="fad fa-clock IconAnuncio"></i>${key.data}</div>
				</div>
				<div class="a-anuncioEscrito">${key.mensagem}</div>
			</div>

			`)
		});
    });
}

function enviarAnuncio(){
	let $el = $('#enviarAnuncio');
	let mensagem = $("#inputAnuncio").val();
	if($el.length) {
		$.post("http://wine_groups/enivarAnuncio",JSON.stringify({
			mensagem:mensagem,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				FecharFormat("anuncio")
			} 
		});
	}
};

// ----------------------------------------
// -- Chat
// ----------------------------------------

function listaChat(){
    $.post("http://wine_groups/chatLista",JSON.stringify({}),(data) => {
		let chatLista = data.chatLista.sort((a,b) => (b.id > a.id) ? 1: -1);
		$('.mensagens-box').empty()
		
		$("#mensagens").animate({ scrollTop: 20000000 }, "slow");
		
		chatLista.forEach((key,value) => {
			$('.mensagens-box').prepend(`

			<div class="mensagem-item">
				<img class="msg-img-player" src="${key.imagem}" alt="">
				<div class="msg-nome-player">${key.nome} <ss style="color: #295CDE;">#${key.passaporte}</ss> | ${key.data}</div>
				<div class="msg-box"><div class="mensagem-done">${key.mensagem}</div></div>
			</div>

			`)
		});
    });
}

function enviarChat(){
	let $el = $('.button-eve');
	let mensagem = $("#chat-input").val();
	if($el.length) {
		if($("#chat-input").val() != "" && $("#chat-input").val() != " " ){
			$.post("http://wine_groups/enviarChat",JSON.stringify({
			mensagem:mensagem,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
		}
	}
};

// ----------------------------------------
// -- Membros Lista
// ----------------------------------------

function membrosLista(){
    $.post("http://wine_groups/membrosLista",JSON.stringify({}),(data) => {
		let membrosLista = data.membrosLista.sort((a,b) => (b.id > a.id) ? 1: -1);
		$('#contratadosLista').empty()
		if (cargo_player_acessando == "Lider" || cargo_player_acessando == "Sub-Lider" ||  cargo_player_acessando == "Administrador" || cargo_player_acessando == "Chefe" || cargo_player_acessando == "Gerente") {

			membrosLista.forEach((key,value) => {
				$('#contratadosLista').prepend(`
	
				<div class="item-contratados" id="item-contratado">
					<div class="i-t-1">
						<div class="i-t-1-text">#${key.passaporte}</div>
					</div>
					<div class="i-t-2">
						<img class="imagem-ct" src="${key.img}" alt="">
						<div class="nome-ct">${key.nome}</div>
						<div class="cargo-ct">${key.cargo}</div>
					</div>
					<div class="i-t-3">
						<div class="i-t-3-text" style="color: ${key.color};"><i class="fad fa-toggle-on IconT3"></i>${key.status}</div>
					</div>
					<div class="i-t-4">
						<div class="i-t-4-text"><i class="fad fa-id-card IconT3"></i>${key.contratante}</div>
					</div>
					<div class="i-t-5">
						<div class="upB Pupgrade" onclick="promover(this)" data-passaporte="${key.passaporte}"><i class="fad fa-angle-up IconT5"></i></div>
						<div class="upB Prebaixar" onclick="rebaixar(this)" data-passaporte="${key.passaporte}"><i class="fad fa-angle-down IconT5"></i></div>
						<div class="upB Pdemitir" onclick="demitir(this)" data-passaporte="${key.passaporte}"><i class="fad fa-times IconT5"></i></div>
					</div>
				</div>
	
				`)
			});

		} else if(cargo_player_acessando == "Gerente" || cargo_player_acessando == "Sub-Lider" || cargo_player_acessando == "Administrador") {

			membrosLista.forEach((key,value) => {
				$('#contratadosLista').prepend(`
	
				<div class="item-contratados" id="item-contratado">
					<div class="i-t-1">
						<div class="i-t-1-text">#${key.passaporte}</div>
					</div>
					<div class="i-t-2">
						<img class="imagem-ct" src="${key.img}" alt="">
						<div class="nome-ct">${key.nome}</div>
						<div class="cargo-ct">${key.cargo}</div>
					</div>
					<div class="i-t-3">
						<div class="i-t-3-text" style="color: ${key.color};"><i class="fad fa-toggle-on IconT3"></i>${key.status}</div>
					</div>
					<div class="i-t-4">
						<div class="i-t-4-text"><i class="fad fa-id-card IconT3"></i>${key.contratante}</div>
					</div>
					<div class="i-t-5">
						<div class="upB Pupgrade" onclick="promover(this)" data-passaporte="${key.passaporte}"><i class="fad fa-angle-up IconT5"></i></div>
						<div class="upB Prebaixar" onclick="rebaixar(this)" data-passaporte="${key.passaporte}"><i class="fad fa-angle-down IconT5"></i></div>
						<div class="upB Pdemitir" onclick="demitir(this)" data-passaporte="${key.passaporte}"><i class="fad fa-times IconT5"></i></div>
					</div>
				</div>
	
				`)
			});
			

		} else {

			membrosLista.forEach((key,value) => {
				$('#contratadosLista').prepend(`
	
				<div class="item-contratados" id="item-contratado">
					<div class="i-t-1">
						<div class="i-t-1-text">#${key.passaporte}</div>
					</div>
					<div class="i-t-2">
						<img class="imagem-ct" src="${key.img}" alt="">
						<div class="nome-ct">${key.nome}</div>
						<div class="cargo-ct">${key.cargo}</div>
					</div>
					<div class="i-t-3">
						<div class="i-t-3-text" style="color: ${key.color};"><i class="fad fa-toggle-on IconT3"></i>${key.status}</div>
					</div>
					<div class="i-t-4">
						<div class="i-t-4-text"><i class="fad fa-id-card IconT3"></i>${key.contratante}</div>
					</div>
					<div class="i-t-5"></div>
				</div>
	
				`)
			});

		}
    });
}


function promover(data){
	$.post("http://wine_groups/promover",JSON.stringify({
		passaporte: data.dataset.passaporte,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
}

function rebaixar(data){
	$.post("http://wine_groups/rebaixar",JSON.stringify({
		passaporte: data.dataset.passaporte,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
}

function demitir(data){
	$.post("http://wine_groups/demitir",JSON.stringify({
		passaporte: data.dataset.passaporte,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
}

// ----------------------------------------
// -- Contratar
// ----------------------------------------

function AbrirContratar(){
	$(".format").fadeIn(500);
	$(".format-contratar-box").fadeIn(500);
}

function EnviarPassaporteContratar(){
	let $el = $('.fa-EnviarAnuncio');
	let passaporte = $("#passaporteContratar").val();
	$(".format").fadeOut(500);
	$(".format-contratar-box").fadeOut(500);
	if($el.length) {
			$.post("http://wine_groups/passaporteContratar",JSON.stringify({
				passaporte:passaporte,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				contratar()
			} 
		});
	}
}

function contratar(){
	let $el = $('.button-eve');
	let passaporte = $("#passaporteContratar").val();
	if($el.length) {
			$.post("http://wine_groups/contratar",JSON.stringify({
				passaporte:passaporte,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
	}
}

function contratarVerifyDc(){
	let $el = $('.button-eve');
	let discordid = $("#inputdiscordid").val();
	if($el.length) {
			$.post("http://wine_groups/contratarVerify",JSON.stringify({
			discordid:discordid,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				$(".format").fadeOut(500);
				$(".format-setarId-box").fadeOut(500);
				refreshTables()
				limparInputs()
			} 
		});
	}
};

// ----------------------------------------
// -- Deposito
// ----------------------------------------

function ListaBanco(){
    $.post("http://wine_groups/ListaBanco",JSON.stringify({empresa: nomeEmpresa}),(data) => {
		let extrato = data.extrato.sort((a,b) => (a.id > b.id) ? 1: -1);
		$('#extrato').empty()
		
		extrato.forEach((key,value) => {
			if (key.atividade == 'Depósito') {
			$('#extrato').prepend(`

				<div class="item-contratados">
						<div class="i-t-1">
							<div class="i-t-1-text">#${key.passaporte}</div>
						</div>
						<div class="i-t-2">
							<img class="imagem-ct" src="${key.imagemplayer}" alt="">
							<div class="nome-ct">${key.nome}</div>
							<div class="cargo-ct">${key.cargo}</div>
						</div>
						<div class="i-t-4">
							<div class="i-t-4-text" style="color:green"><i class="far fa-dollar-sign IconT3"></i>${key.valor}</div>
						</div>
						<div class="i-t-5">
						<div class="i-t-4-text"><i class="far fa-boxes IconT3"></i>${key.atividade}</div>
						</div>
					</div>

			`)		
			} else {
				$('#extrato').prepend(`

				<div class="item-contratados">
						<div class="i-t-1">
							<div class="i-t-1-text">#${key.passaporte}</div>
						</div>
						<div class="i-t-2">
							<img class="imagem-ct" src="${key.imagemplayer}" alt="">
							<div class="nome-ct">${key.nome}</div>
							<div class="cargo-ct">${key.cargo}</div>
						</div>
						<div class="i-t-4">
							<div class="i-t-4-text" style="color:red"><i class="far fa-dollar-sign IconT3"></i>${key.valor}</div>
						</div>
						<div class="i-t-5">
						<div class="i-t-4-text"><i class="far fa-boxes IconT3"></i>${key.atividade}</div>
						</div>
					</div>

			`)		
			}
		});
    });
}


function abrirDeposito(){
	$(".format").fadeIn(500);
	$(".format-depositar-box").fadeIn(500);
}
function setValorDeposito(valor) {
	$(".format").fadeOut(500);
	$(".format-depositar-box").fadeOut(500);
	
	$.post("http://wine_groups/depositar",JSON.stringify({
		empresa:nomeEmpresa,
		valor:valor,

	}));
	refreshTables()
	$("#banco-Empresa").html("$ " + (banco + valor) );

}
function EnviarValorDeposito(){
	let $el = $('.fa-EnviarAnuncio');
	let valor = $("#valorDeposito").val();
	$(".format").fadeOut(500);
	$(".format-depositar-box").fadeOut(500);
	if($el.length) {
			$.post("http://wine_groups/depositar",JSON.stringify({
				empresa:nomeEmpresa,
				valor:valor,

		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				contratar()
				$("#banco-Empresa").html("$ " + (banco + valor) );
			} 
		});
	}
	
}



// ----------------------------------------
// -- Sacar
// ----------------------------------------

function abrirSaque(){
	if (cargo_player_acessando == "Lider" || cargo_player_acessando == "Sub-Lider" || cargo_player_acessando == "Administrador" || cargo_player_acessando == "Chefe" || cargo_player_acessando == "Gerente"  ) {
	$(".format").fadeIn(500);
	$(".format-sacar-box").fadeIn(500);
	}
}

function setValorRetirada(valor) {
	$(".format").fadeOut(500);
	$(".format-sacar-box").fadeOut(500);
	
	$.post("http://wine_groups/sacar",JSON.stringify({
		empresa:nomeEmpresa,
		valor:valor,

	}));
	refreshTables()
	$("#banco-Empresa").html("$ " + (banco - valor) );
}
function EnviarValorRetirada(){
	let $el = $('.fa-EnviarAnuncio');
	let valor = $("#valorRetirada").val();
	$(".format").fadeOut(500);
	$(".format-sacar-box").fadeOut(500);
	if($el.length) {
			$.post("http://wine_groups/sacar",JSON.stringify({
				empresa:nomeEmpresa,
				valor:valor,

		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				contratar()
				$("#banco-Empresa").html("$ " + (banco - valor) );
			} 
		});
	}
}



// ----------------------------------------
// -- Vendas
// ----------------------------------------

function criarVendaNui(){
	$("#pagina-vendas").fadeOut(500);
	$("#pagina-criarvenda").fadeIn(500);
}

function bauFac(){
    $.post("http://wine_groups/bauFac",JSON.stringify({ nome: nomeEmpresa }),(data) => {
		let bauFac = data.bauFac.sort((a,b) => (b.item > a.item) ? 1: -1);
		$('.overflow-bau').empty()
		$('.overflow-bau').empty()
		
		bauFac.forEach((key,value) => {
			$('.overflow-bau').prepend(`

				<div class="item-bau">
					<div class="nome-itembau">${key.name}</div>
					<img class="img-itembau" src="${key.linkimgs}/${key.index}.png" alt="">
					<div class="quantidade-itembau">${key.amount}x</div>
				</div>

			`)
		});
    });
}



function ListaVendas(){
    $.post("http://wine_groups/ListaVendas",JSON.stringify({}),(data) => {
		let ListaVendas = data.ListaVendas.sort((a,b) => (a.id > b.id) ? 1: -1);
		$('#VendasListaOverflow').empty()
		
		ListaVendas.forEach((key,value) => {

			$('#VendasListaOverflow').prepend(`

				<div class="item-contratados">
						<div class="i-t-1">
							<div class="i-t-1-text">#${key.passaporte}</div>
						</div>
						<div class="i-t-2">
							<img class="imagem-ct" src="${key.imagemplayer}" alt="">
							<div class="nome-ct">${key.vendedor}</div>
							<div class="cargo-ct">${key.cargo}</div>
						</div>
						<div class="i-t-4">
							<div class="i-t-4-text"><i class="far fa-boxes IconT3"></i>${key.valor} $</div>
						</div>
						<div class="i-t-5">
							<div class="upB verVenda" onclick="verVenda(this)" data-idvenda="${key.id}"><i class="fad fa-eye IconT5"></i></div>
							<div class="upB deletarVenda" onclick="deletarVenda(this)" data-idvenda="${key.id}"><i class="fad fa-trash IconT5"></i></div>
						</div>
					</div>

	`)		
		});
    });
}

function verVenda(data){
	$.post("http://wine_groups/verVenda",JSON.stringify({
		idvenda: data.dataset.idvenda,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				$(".imagem-vervenda").attr(`src`,data.imagem);
				$(".img-vendedor").attr(`src`,data.imagemplayer);
				$("#nome-vendedor").html(data.vendedor);
				$("#passaporte-vendedor").html(" #" + data.passaporte);
				$("#DataVendaBox").html(data.data);
				$("#ValorVendaBox").html(data.valor + " $");
				$("#ProdutoVendido").html(data.comprador + "");
				$("#iddavenda").html("#" + data.idvenda);
				$(".format").fadeIn(500);
				$(".format-ver-venda").fadeIn(500);
			} 
		});
}

function deletarVenda(data){
	$.post("http://wine_groups/deletarVenda",JSON.stringify({
		idvenda: data.dataset.idvenda,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
			} 
		});
}


function AdicionarImagem(){
	$(".format").fadeIn(500);
	$(".format-enviarimgvenda-box").fadeIn(500);
}

function AdicionarImagem2(){
	let $el = $('.fa-EnviarAnuncio');
	let linkimagem = $("#imagemvenda").val();
	if($el.length) {
			$.post("http://wine_groups/imagemVenda",JSON.stringify({
				linkimagem:linkimagem,
		}), (data) =>{ 
			if(data.retorno == 'done') {
				refreshTables()
				limparInputs()
				$(".sumir-imagemvenda").hide(0);
				$(".aparecer-imagem").attr(`src`,linkimagem);
				$(".aparecer-imagem").show(0);
				FecharFormat('enviarimgvenda')
			} 
		});
	}
}

function criarVendaConfirm(){
	let compradorInput = $("#compradorInput").val();
	let valorInput = $("#valorInput").val();
	$.post("http://wine_groups/criarVendaConfirm",JSON.stringify({
		valorInput:valorInput,
		compradorInput:compradorInput,
		}), (data) =>{ 
	if(data.retorno == 'done') {
			refreshTables()
			limparInputs()
			TrocarPagina('vendas')
		} 
	});
}

function PagarUpgrade(){
	$.post("http://wine_groups/pagarUpgrade");
}
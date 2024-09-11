window.addEventListener("message", (event) => {
    const data = event.data;

    if (data.show) {
        if (data.show != undefined) {
            let drugs = data.drugs;
            let money = data.money;

            $(".mesa").html(`<h5 onclick="closeAll()">X</h5>`);
            $(".mesa").css("display","flex");

            drugs.forEach((text,index) => {
                $(".mesa").append(`
                    <div>
                        <img src="skdev/img/${text.img}.png" draggable="false">
                        <div>
                            <h2>Na Mesa: ${text.drugintable}</h2>
                            <h2>(1x) R$${text.price}</h2>
                            <div>
                                <button onclick="putDrug('${text.drugname}')">COLOCAR</button>
                                <button onclick="remDrug('${text.drugname}')">RETIRAR</button>
                            </div>
                        </div>
                    </div>
                `);
            });

            $(".mesa").append(`
                <div>
                    <img src="skdev/img/money.png" draggable="false">
                    <div>
                        <h2>Dinheiro Disponivel</h2>
                        <h2>R$${money}</h2>
                        <div>
                            <button onclick="withdrawMoney()">RETIRAR</button>
                        </div>
                    </div>
                </div>
            `);
        }
    }
});

document.addEventListener("keyup", (event) => {
    if (event.isComposing || event.key === "Escape") {
        closeAll();
    }
});

function closeAll() {
    $(".mesa").css("display","none");
    $.post("https://skdev_mesas/close", JSON.stringify({}), (data) => {});
}

function putDrug(drug) {
    $.post("https://skdev_mesas/putDrug", JSON.stringify({drug: drug}), (data) => {});
    closeAll();
}

function remDrug(drug) {
    $.post("https://skdev_mesas/remDrug", JSON.stringify({drug: drug}), (data) => {});
    closeAll();
}

function withdrawMoney() {
    $.post("https://skdev_mesas/withdrawMoney", JSON.stringify({}), (data) => {});
    closeAll();
}
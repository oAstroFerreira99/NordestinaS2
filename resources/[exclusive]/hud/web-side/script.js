function FadeElementRight(el, translateX = 150) {
    if (el.dataset.show == "true" || el.dataset.show == undefined) {
        el.dataset.show = false;
        el.animate([{ transform: "translateX(0%)" }, { transform: `translateX(${translateX}%)` }], {
            easing: "ease-in-out",
            fill: "both",
            duration: 500,
        }).onfinish = () => (el.style.display = "none");
    }
}

function ShowElementRight(el, translateX = 150) {
    if (!el.dataset.show || el.dataset.show == "false") {
        el.style.removeProperty("display");
        el.dataset.show = true;
        el.animate([{ transform: `translateX(${translateX}%)` }, { transform: "translateX(0%)" }], {
            easing: "ease-in-out",
            fill: "both",
            duration: 500,
        });
    }
}

function SetBasicInfo({ coins, id, radio, mic, talking, weapon }) {
    const coinsEl = document.getElementById("coins");
    const idEl = document.getElementById("id");
    const radioEl = document.getElementById("radio");
    const micEl = document.getElementById("mic");

    const weaponEl = document.getElementById("weapon");
    const weaponImg = document.getElementById("weapon-img");
    const weaponAmmo = document.getElementById("weapon-ammo");

    mic--;

    coinsEl.innerHTML = coins;
    idEl.innerHTML = id;
    radioEl.innerHTML = radio ? radio + " mHz" : "desligado";

    micEl.innerHTML = new Array(4)
        .fill("")
        .map((_, idx) => /*html*/ `<div class="h-5 bg-${talking ? "green-500" : "white"}${idx <= mic ? "" : "/10"} w-2 rounded"></div>`)
        .join("");

    if (weapon) {
        weaponImg.src = weapon.img;
        weaponAmmo.innerHTML = weapon.ammo + " / " + weapon.maxAmmo;

        ShowElementRight(weaponEl);
    } else FadeElementRight(weaponEl);
}

function SetPlayerStats({ health, armor, food, water, stamina, oxygen, speed, nitro, gas, engine, seatbelt, door, rpm, vehicle }) {
    const normalHud = document.getElementById("normal-hud");
    const vehicleHud = document.getElementById("vehicle-hud");

    if (vehicle) {
        const healthEl = document.getElementById("health-vehicle");
        const armorEl = document.getElementById("armor-vehicle");
        const foodEl = document.getElementById("food-vehicle");
        const waterEl = document.getElementById("water-vehicle");
        const staminaEl = document.getElementById("stamina-vehicle");

        const rpmEl = document.getElementById("rpm");
        const nitroEl = document.getElementById("nitro");
        const gasEl = document.getElementById("gas");
        const engineEl = document.getElementById("engine");

        const speedEl = document.getElementById("speed");

        const seatbeltEl = document.getElementById("seatbelt");
        const doorEl = document.getElementById("door");

        if (speed < 9) {
            speed = "<span class='text-white/45'>00</span>" + speed;
        } else if (speed < 99) {
            speed = "<span class='text-white/45'>0</span>" + speed;
        }

        healthEl.style.setProperty("--_height", health + "%");
        armorEl.style.setProperty("--_height", armor + "%");
        foodEl.style.setProperty("--_height", food + "%");
        waterEl.style.setProperty("--_height", water + "%");
        staminaEl.style.setProperty("--_height", stamina + "%");

        rpmEl.style.strokeDashoffset = -330 - (330 * (100 - rpm)) / 100;
        engineEl.style.strokeDashoffset = -560 - (100 * (100 - engine)) / 100;
        gasEl.style.strokeDashoffset = -560 - (100 * (100 - gas)) / 100;
        nitroEl.style.strokeDashoffset = -590 - (70 * (100 - nitro)) / 100;

        speedEl.innerHTML = speed;

        seatbeltEl.style.filter = !seatbelt ? "saturate(0) brightness(200%)" : "";
        doorEl.style.filter = !door ? "saturate(0) brightness(200%)" : "";
    } else {
        const healthEl = document.getElementById("health");
        const armorEl = document.getElementById("armor");
        const foodEl = document.getElementById("food");
        const waterEl = document.getElementById("water");
        const staminaEl = document.getElementById("stamina");
        const oxygenEl = document.getElementById("oxygen");

        healthEl.style.setProperty("--_width", health + "%");
        armorEl.style.setProperty("--_width", armor + "%");
        foodEl.style.setProperty("--_height", food + "%");
        waterEl.style.setProperty("--_height", water + "%");
        staminaEl.style.setProperty("--_height", stamina + "%");
        oxygenEl.style.setProperty("--_height", oxygen + "%");

        if (oxygen < 100) {
            ShowElementRight(oxygenEl);
        } else {
            FadeElementRight(oxygenEl);
        }

        if (stamina > 0) {
            ShowElementRight(staminaEl);
        } else {
            FadeElementRight(staminaEl);
        }

        if (armor <= 0) {
            FadeElementRight(armorEl);
        } else {
            ShowElementRight(armorEl);
        }
    }

    if (vehicle) {
        FadeElementRight(normalHud);

        if (!vehicleHud.dataset.show || vehicleHud.dataset.show == "false") {
            vehicleHud.dataset.show = true;
            vehicleHud.animate([{ transform: `translateY(150%)` }, { transform: "translateY(0%)" }], {
                easing: "ease-in-out",
                fill: "both",
                duration: 500,
            });
        }
    } else {
        ShowElementRight(normalHud);

        if (vehicleHud.dataset.show == "true" || vehicleHud.dataset.show === undefined) {
            vehicleHud.dataset.show = false;
            vehicleHud.animate([{ transform: "translateY(0%)" }, { transform: `translateY(150%)` }], {
                easing: "ease-in-out",
                fill: "both",
                duration: 500,
            });
        }
    }
}

let basicInfoData = {
    coins: 0,
    id: 25,
    radio: false,
    mic: 2,
    talking: false,
    weapon: false,
};

let playerStats = {
    health: 100,
    armor: 100,
    food: 100,
    water: 100,
    stamina: 0,
    oxygen: 100,
    speed: 0,
    rpm: 35,
    engine: 100,
    gas: 100,
    door: true,
};

SetBasicInfo(basicInfoData);
SetPlayerStats(playerStats);

window.addEventListener("message", (event) => {
    switch (event.data.name) {
        case "Frequency":
            basicInfoData.radio = event.data.payload === "Offline" ? false : event.data.payload;
            SetBasicInfo(basicInfoData);
            break;

        case "Body":
            if (event.data.payload) {
                !document.body.classList.contains("grid") && document.body.classList.add("grid");
            } else {
                document.body.classList.contains("grid") && document.body.classList.remove("grid");
            }
            // document.body.style.display = event.data.payload ? "grid" : "none";
            break;

        case "Passport":
            basicInfoData.id = event.data.payload;
            SetBasicInfo(basicInfoData);
            break;

        case "Voice":
            basicInfoData.talking = event.data.payload;
            SetBasicInfo(basicInfoData);
            break;

        case "Voip":
            if (event.data.payload == "Online") return;
            const modes = { Baixo: 1, Normal: 2, Médio: 3, Alto: 4 };
            basicInfoData.mic = modes[event.data.payload];
            SetBasicInfo(basicInfoData);
            break;

        case "Gemstone":
            basicInfoData.coins = event.data.payload;
            SetBasicInfo(basicInfoData);
            break;

        case "Stress":
            playerStats.stamina = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Oxygen":
            playerStats.oxygen = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Health":
            playerStats.health = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Armour":
            playerStats.armor = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Hunger":
            playerStats.food = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Thirst":
            playerStats.water = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Fuel":
            playerStats.gas = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Speed":
            playerStats.speed = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Rpm":
            playerStats.rpm = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Seatbelt":
            playerStats.seatbelt = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Locked":
            playerStats.door = event.data.payload == 2;
            SetPlayerStats(playerStats);
            break;

        case "Vehicle":
            playerStats.vehicle = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Thirst":
            playerStats.water = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Engine":
            playerStats.engine = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Fuel":
            playerStats.fuel = event.data.payload;
            SetPlayerStats(playerStats);
            break;

        case "Nitro":
            playerStats.nitro = (100 * event.data.payload) / 2000;
            SetPlayerStats(playerStats);
            break;

        case "Weapons":
            basicInfoData.weapon = event.data.payload &&
                event.data.payload[0] && {
                    img: "./assets/weapons/" + event.data.payload[3] + ".png",
                    ammo: event.data.payload[1],
                    maxAmmo: event.data.payload[2],
                };
            SetBasicInfo(basicInfoData);
            break;

        case "Progress":
            const progressContainer = document.getElementById("progress-container");
            const progressCircle = document.getElementById("progress-circle");

            const time = event.data.payload[0];

            progressContainer.animate([{ opacity: 0 }, { opacity: 1 }], {
                easing: "ease-in-out",
                duration: 500,
                fill: "both",
            });

            progressCircle.animate([{ strokeDashoffset: 160 }, { strokeDashoffset: 0 }], {
                easing: "ease-in-out",
                duration: time,
                fill: "both",
            }).onfinish = () => {
                progressContainer.animate([{ opacity: 1 }, { opacity: 0 }], {
                    easing: "ease-in-out",
                    duration: 500,
                    fill: "both",
                });
            };
            break;
    }
});

function rescalePage() {
    const width = window.innerWidth;
    const height = window.innerHeight;
    const resizeElements = document.querySelectorAll("body > *");

    resizeElements.forEach((element) => (element.style.zoom = (height / 1080) * 0.91));
}

rescalePage();

window.onresize = rescalePage;
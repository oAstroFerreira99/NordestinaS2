-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("pause",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Marketplace = {}
local Shopping = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Home()
    local source = source
    local Passport = vRP.Passport(source)
    local Identity = vRP.Identity(Passport)
    if Identity then
        local Account = vRP.Account(Identity["License"])
        local Home = {
            ["Information"] = {
                ["Passport"] = Passport,
                ["Name"] = Identity["name"].." "..Identity["name2"],
                ["Bank"] = Identity["bank"],
                ["Sex"] = Identity["sex"],
                ["Blood"] = Sanguine(Identity["blood"]),
                ["Phone"] = Identity["phone"],
                ["Diamonds"] = vRP.UserGemstone(Identity["license"]),
                ["Medic"] = vRP.Medicplan(Passport)
            },
            ["Premium"] = Premium(Passport),
            ["Carousel"] = Carousel(),
            ["Shopping"] = Shopping,
            ["Experience"] = Experience(Passport),
            ["Box"] = Boxes[1]
        }

        return Home
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAMONDSLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.DiamondsList()
    local DiamondsList = {}
    for Index,v in pairs(ShopItens) do
        DiamondsList[#DiamondsList + 1] = {
            ["Index"] = Index,
            ["Description"] = itemDescription(Index),
            ["Image"] = itemIndex(Index),
            ["Name"] = itemName(Index),
            ["Price"] = v["Price"],
            ["Discount"] = v["Discount"]
        }
    end

    return DiamondsList
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUMRENEW
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PremiumRenew()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Consult = Premium(Passport)
        if not Consult["Active"] then
            if vRP.PaymentGems(Passport,Consult["Value"]) then
                vRP.SetPremium(source,Passport,HierarchyPremium)
                return true
            end
        elseif vRP.UserPremium(Passport) then
            if vRP.PaymentGems(Passport,Consult["Price"]) then
                vRP.UpgradePremium(source,Passport,HierarchyPremium)
                return true
            end
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAMONDSBUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.DiamondsBuy(Item,Amount)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and ShopItens[Item] then
        local Price = ShopItens[Item]["Price"] * ( 1 - ShopItens[Item]["Discount"] / 100 )
        Amount = itemName(Item) and 1 or Amount

        if vRP.PaymentGems(Passport,Amount * Price) then
            vRP.GenerateItem(Passport,Item,Amount)

            Shopping[#Shopping + 1] = {
                ["Image"] = itemIndex(Item),
                ["Name"] = vRP.FullName(Passport),
                ["Amount"] = Amount,
                ["Price"] = Price
            }

            return Amount
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Rolepass()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        local Counter = {
            ["Free"] = 1,
            ["Premium"] = 1
        }

		local Free = {}
		for _,v in ipairs(RoleItens["Free"]) do
            Free[#Free + 1] = {
				["id"] = Counter["Free"],
				["Index"] = v["Item"],
				["Amount"] = v["Amount"] or 1,
				["Name"] = itemName(v["Item"]),
				["Image"] = itemIndex(v["Item"]),
				["Description"] = itemDescription(v["Item"]),
				["Price"] = v["Price"],
				["Discount"] = v["Discount"]
			}

			Counter["Free"] = Counter["Free"] + 1
		end

		local Premium = {}
		local PremiumCounter = 1
		for _,v in ipairs(RoleItens["Premium"]) do
            Premium[#Premium + 1] = {
				["id"] = Counter["Premium"],
				["Index"] = v["Item"],
				["Amount"] = v["Amount"] or 1,
				["Name"] = itemName(v["Item"]),
				["Image"] = itemIndex(v["Item"]),
				["Description"] = itemDescription(v["Item"]),
				["Price"] = v["Price"],
				["Discount"] = v["Discount"]
			}

			Counter["Premium"] = Counter["Premium"] + 1
		end

        local Rolepass = vRP.rolepass(Passport)

		return {
			["Total"] = Rolepass["Total"],
			["Free"] = Free,
            ["Premium"] = Premium,
			["Points"] = Rolepass["Points"] or 0,
			["AtualFree"] = Rolepass["Free"] or 0,
			["AtualPremium"] = Rolepass["Premium"] or 0,
			["Finish"] = Rolepass["Clean"] - os.time(),
			["Active"] = Rolepass["Active"] or false
		}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASSBUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RolepassBuy()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and not vRP.Rolepass(Passport) then
        if vRP.PaymentGems(Passport,RolepassPrice) then
            vRP.RolepassBuy(Passport)
            return true
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASSRESCUE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RolepassRescue(Mode,Number)
    local source = source
    local Passport = vRP.Passport(source)
    local Rolepass = vRP.Rolepass(Passport)
    if Passport and Rolepass then
        local Item = RoleItens[Mode][Number]["Item"]
        local Amount = RoleItens[Mode][Number]["Amount"]

        if vRP.CheckWeight(Passport,Item,Amount) then
            if vRP.RolepassPayment(Passport,500,Mode) then
                vRP.GenerateItem(Passport,Item,Amount)
                return true
            end

            return false
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENBOXES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.OpenBoxes(Number)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Price = Boxes[Number]["Price"] * ( 1 - Boxes[Number]["Discount"] / 100 )
        if vRP.PaymentGems(Passport,parseInt(Price)) then
            return math.random(1,5)
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTBOXES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PaymentBoxes(Box,Item)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if ContentBoxes[Box] then
            for _,v in ipairs(ContentBoxes[Box]) do
                if v["Id"] == Item then
                    vRP.GenerateItem(Passport,v["Item"],v["Amount"])
                    return true
                end
            end
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKETPLACE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Marketplace()
    local Market = {}
    for Index,v in pairs(Marketplace) do
        if v["timer"] >= os.time() then
            Market[#Market + 1] = {
                ["id"] = Index,
                ["key"] = v["key"],
                ["price"] = v["price"],
                ["label"] = itemName(v["key"]),
                ["quantity"] = v["quantity"]
            }
        end
    end

    return Market
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKETINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.MarketInventory(Mode)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Inventory = {}
        if Mode == "create" then        
            local Inv = vRP.Inventory(Passport)
            for Index,v in pairs(Inv) do
                if vRP.CheckDamaged(v["item"]) then
                    return
                end

                if not BlockMarket(SplitOne(v["item"])) then
                    Inventory[#Inventory + 1] = {
                        ["slot"] = v["item"],
                        ["quantity"] = parseInt(v["amount"]),
                        ["label"] = itemName(v["item"]),
                        ["key"] = itemIndex(v["item"])
                    }
                end
            end
        elseif Mode == "announce" then
            for Index,v in pairs(Marketplace) do
                if v["passport"] == Passport then
                    Inventory[#Inventory + 1] = {
                        ["price"] = v["price"],
                        ["id"] = Index,
                        ["key"] = v["key"],
                        ["label"] = itemName(v["key"])
                    }
                end
            end
        end

        return Inventory
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKETANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.MarketAnnounce(Data)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.PaymentFull(Passport,MarketplacePost,true) then
            if vRP.TakeItem(Passport,Data["item"],Data["quantity"]) then
                local Counter = 1

                while Marketplace[tostring(Counter)] do
                    Counter = Counter + 1
                end

                Marketplace[tostring(Counter)] = {
                    ["passport"] = Passport,
                    ["item"] = Data["item"],
                    ["key"] = itemIndex(SplitOne(Data["item"])),
                    ["quantity"] = Data["quantity"],
                    ["timer"] = os.time() + 259200,
                    ["price"] = Data["price"]
                }

                return true
            end

            return false
        end

        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKETBUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.MarketBuy(Number)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        for Index,v in pairs(Marketplace) do
            if Number == Index then
                local OtherPassport = v["passport"]
                local Key = v["key"]
                local Item = v["item"]
                local Amount = v["quantity"]
                local Price = v["price"]

                if not vRP.MaxItens(Passport,Key,Amount) and vRP.PaymentFull(Passport,Price) then
                    vRP.GiveItem(Passport,Item,Amount)
                    vRP.GiveBank(OtherPassport,Price)
                    Marketplace[Number] = nil

                    return true
                end

                return false
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKETCANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.MarketCancel(Number)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        for Index,v in pairs(Marketplace) do
            if Number == Number then
                local Item = v["item"]
                local Amount = v["quantity"]
                local Price = v["price"]

                if Passport == v["passport"] then
                    vRP.GiveItem(Passport,Item,Amount)
                    Marketplace[Number] = nil

                    return true
                end

                return false
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAROUSEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Carousel()
    local Carousel = {}
    local Counter = 0
    for Index,v in pairs(ShopItens) do
        if v["Discount"] ~= 0 then
            Carousel[#Carousel + 1] = {
                ["id"] = Counter,
                ["Name"] = itemName(Index),
                ["Index"] = Index,
                ["Image"] = itemIndex(Index),
                ["Discount"] = v["Price"] * (1 - (v["Discount"] / 100)),
                ["Amount"] = 1,
                ["Price"] = v["Price"]
            }

            Counter = Counter + 1
        end
    end

    return Carousel
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Experience(Passport)
    local Experience = {}
    local Datatable = vRP.Datatable(Passport)
    if Datatable then
        for Index,v in pairs(Works) do
            Experience[#Experience + 1] = {
                v,Datatable[Index] or 0
            }
        end
    end

    return Experience
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function Premium(Passport)
    local Premium = {
        ["Active"] = vRP.UserPremium(Passport),
        ["Value"] = PremiumRenew[HierarchyPremium]["Value"],
        ["Price"] = PremiumRenew[HierarchyPremium]["Price"]
    }

    return Premium
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("SaveServer",function(Silenced)
	vRP.SetSrvData("Marketplace",Marketplace,true)

	if not Silenced then
        print("O resource ^2Marketplace^7 salvou os dados.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ONRESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("onResourceStart")
AddEventHandler("onResourceStart",function(Resource)
	if (GetCurrentResourceName() ~= Resource) then
		return
	end

    for Index,v in pairs(vRP.GetSrvData("Marketplace",true)) do
        Marketplace[Index] = v
    end
end)
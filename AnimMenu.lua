--// Animation & Emote Menu | Toggle: Alt
local Players       = game:GetService("Players")
local UIS           = game:GetService("UserInputService")
local StarterGui    = game:GetService("StarterGui")
local HttpService   = game:GetService("HttpService")
local InsertService = game:GetService("InsertService")
local LP            = Players.LocalPlayer

local function notify(t)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "Anim Menu",
			Text = tostring(t),
			Duration = 3
		})
	end)
end

------------------------------------------------------------------ DATE CLASICE
local function P(n, i1, i2, w, r, j, f, c, s, si)
	return {
		name = n, isClassic = true,
		idle1 = i1, idle2 = i2, walk = w, run = r,
		jump = j, fall = f, climb = c, swim = s, swimidle = si
	}
end

local ClassicPacks = {
	P("Default R15", 507766666, 507766951, 507777826, 507767714, 507765000, 507767968, 507765644, 507784897, 507785072),
	P("Vampire", 1083445855, 1083450166, 1083473930, 1083462077, 1083455352, 1083443587, 1083439238, 1083222527, 1083225406),
	P("Werewolf", 1083195517, 1083214717, 1083178339, 1083216690, 1083218792, 1083189019, 1083182000, 1083222527, 1083225406),
	P("Hero", 616111295, 616113536, 616122287, 616117076, 616115533, 616108001, 616104706, 616119360, 616120861),
	P("Zombie", 616158929, 616160636, 616168032, 616163682, 616161997, 616157476, 616156119, 616165109, 616166655),
	P("Mage", 707742142, 707855907, 707897309, 707861613, 707853694, 707829716, 707826056, 707876443, 707894699),
	P("Levitation", 616006778, 616008087, 616013216, 616010382, 616008936, 616005863, 616003713, 616011509, 616012453),
	P("Elder", 845397899, 845400520, 845403856, 845386501, 845398858, 845396048, 845392038, 845401742, 845403127),
	P("Astronaut", 891621366, 891633237, 891667138, 891636393, 891627522, 891617961, 891609353, 891639666, 891663592),
	P("Ninja", 656117400, 656118341, 656121766, 656118852, 656117878, 656115606, 656114359, 656119721, 656121397),
	P("Cartoony", 742637544, 742638445, 742640026, 742638842, 742637942, 742637151, 742636889, 742639220, 742639812),
	P("Pirate", 750781874, 750782770, 750785693, 750783738, 750782230, 750780242, 750779899, 750784579, 750785176),
	P("Sneaky", 1132473842, 1132477671, 1132510133, 1132494274, 1132489853, 1132469004, 1132461372, 1132500520, 1132506407),
	P("Toy", 782841498, 782845736, 782843345, 782842708, 782847020, 782846423, 782843869, 782844582, 782845186),
	P("Knight", 657595757, 657568135, 657552124, 657564596, 658409194, 657600338, 658360781, 657560551, 657557095),
	P("Confident", 1069977950, 1069987858, 1070017263, 1070001516, 1069984524, 1069973677, 1069946257, 1070009914, 1070012133),
	P("Popstar", 1212900985, 1150842221, 1212980338, 1212980348, 1212954642, 1212900995, 1213044953, 1212852603, 1212998578),
	P("Princess", 941003647, 941013098, 941028902, 941015281, 941008832, 941000007, 940996062, 941018893, 941025398),
	P("Cowboy", 1014390418, 1014398616, 1014421541, 1014401683, 1014394726, 1014384571, 1014380606, 1014406523, 1014411816),
	P("Patrol", 1149612882, 1150842221, 1151231493, 1150967949, 1150944216, 1148863382, 1148811837, 1151204998, 1151221899),
	P("Stylish", 616136790, 616138447, 616146177, 616140816, 616139451, 616134815, 616133594, 616143378, 616144772),
	P("Bubbly", 910004836, 910009958, 910034870, 910025107, 910016857, 910001910, 909997997, 910028158, 910030921),
	P("Robot", 616088211, 616089559, 616095330, 616091570, 616090535, 616087089, 616086039, 616092998, 616094091),
	P("Rthro", 2510196951, 2510197257, 2510202577, 2510198475, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162),
	P("Oldschool", 5319828216, 5319831086, 5319847204, 5319844329, 5319841935, 5319839762, 5319816685, 5319850266, 5319852613),
}

local DefaultEmotes = {
	{"Wave", 507770239, true},
	{"Point", 507770453, true},
	{"Cheer", 507770677, true},
	{"Laugh", 507770818, true},
	{"Dance 1", 507771019, true},
	{"Dance 2", 507776043, true},
	{"Dance 3", 507777268, true},
}

------------------------------------------------------------------ CATALOG POPULAR (GENERAT)
local CatalogEmotes = {
	{"Salute", 3360689775},
	{"Tilt", 3360692915},
	{"Applaud", 5915779043},
	{"Shrug", 3576968026},
	{"Stadium", 3360686498},
	{"Hello", 3576686446},
	{"Point2", 3576823880},
	{"Monkey", 3716636630},
	{"Curtsy", 4646306583},
	{"Happy", 4849499887},
	{"Godlike", 3823158750},
	{"Baby Queen - Bouncy Twirl", 14353423348},
	{"Sleep", 4689362868},
	{"Shy", 3576717965},
	{"Baby Queen - Face Frame", 14353421343},
	{"Floss Dance", 5917570207},
	{"Hero Landing", 5104377791},
	{"Yungblud Happier Jump", 15610015346},
	{"Quiet Waves", 7466046574},
	{"Bored", 5230661597},
	{"Baby Queen - Strut", 14353425085},
	{"High Wave", 5915776835},
	{"Alo Yoga Pose - Lotus Position", 12507097350},
	{"Godly Aura fly pose idle", 76361248833307},
	{"Cower", 4940597758},
	{"Effortless Aura Pose", 101573394483995},
	{"Jamal Brazil Groove", 104131847054135},
	{"Baby Dance", 4272484885},
	{"💀MM2 Fake Dead", 132384701706046},
	{"Celebrate", 3994127840},
	{"V Pose - Tommy Hilfiger", 10214418283},
	{"Mae Stephens - Piano Hands", 16553249658},
	{"Endless Aura Floating", 106708015414624},
	{"Frosty Flair - Tommy Hilfiger", 10214406616},
	{"KATSEYE - Touch", 139021427684680},
	{"Sad", 4849502101},
	{"Haha", 4102315500},
	{"Rat Dance", 98603994713783},
	{"Cuco - Levitate", 15698511500},
	{"Wall Phase (GLITCH)", 79017619155911},
	{"Greatest", 3762654854},
	{"Popular", 71302743123422},
	{"[BEST] It's Gangnam Style!", 104142334418357},
	{"/e fly", 93511411593120},
	{"Moonwalk", 111378664166805},
	{"🎃Pumpkin King👑", 105381637724646},
	{"Olivia Rodrigo Head Bop", 15554010118},
	{"Stylish Floating", 88425531063616},
	{"⚡ Raiden Punching Armstrong Loop", 115203580644128},
	{"Line Dance", 4049646104},
	{"🕷️ Hornet's Spider Dance 🕷️", 74716792202343},
	{"Secret Handshake Dance", 120642514156293},
	{"hip sway", 80963950541052},
	{"Psycho Teddy", 95325218641213},
	{"Old Town Road Dance - Lil Nas X (LNX)", 5938394742},
	{"Scuba Nick Wilde", 70919402339484},
	{"Confused", 4940592718},
	{"Festive Dance", 15679955281},
	{"Basketball Head", 107282826166809},
	{"Nervy Dance", 125328720114284},
	{"[BEST] Invisiblity", 130371895389423},
	{"Side to Side", 3762641826},
	{"Beckon", 5230615437},
	{"Yuji Jumping Edit", 113702736944973},
	{"Cute Feet Kicking", 78224683906191},
	{"Floating in Love 🥰", 97164262994588},
	{"Fast Hands", 4272351660},
	{"Dropkick", 127764273000599},
	{"Lush Life", 82727664018494},
	{"HIPMOTION - Amaarae", 16572756230},
	{"Dolphin Dance", 5938365243},
	{"Victory Dance", 15506503658},
	{"🤣 GOOFY FLAP FLY ANIME - FUNNY MEME", 120904242187887},
	{"MJ - P.Y.T. Pretty Young Thing", 137234266130963},
	{"Jumping Wave", 4940602656},
	{"DARE - Gorillaz", 136648387080677},
	{"Spiderman Hang", 108635834286627},
	{"Break Dance", 5915773992},
	{"Dizzy", 3934986896},
	{"Floating on clouds", 111426928948833},
	{"Ghost Floating", 75911227509248},
	{"Floating", 139058906415119},
	{";invisible me", 94292601332790},
	{"Cute Kawaii Posing >-<", 94064805002669},
	{"griddy", 129149402922241},
	{"★ curiously cute sitting pose", 76261461321661},
	{"Sturdy Dance - Ice Spice", 17746270218},
	{"Twirl", 3716633898},
	{"cute dancy dance", 83917238288783},
	{"Moon Walk", 79127989560307},
	{"Wall Aura Farm Pose", 118853736905967},
	{"Cute kawaii girly idle Profile pose", 138515241510970},
	{"Zombie", 4212496830},
	{"Cute Sit", 72947568152049},
	{"silly jumping spider dance", 89157328525577},
	{"SHAKE", 132367660388476},
	{"Tornado", 82995540773684},
	{"HOLIDAY Dance - Lil Nas X (LNX)", 5938396308},
	{"Big Guy - 🔥 Ice Spice x Spongebob", 107708114415320},
	{"Baby Queen - Air Guitar & Knee Slide", 14353417553},
	{"Tall Scary Creature", 79216795769647},
	{"KATSEYE - GNARLY", 133685484220846},
	{"WOOF BARK WOOF", 88859617281337},
	{"Gojo Floating JJK/ The Honored One", 103040723950430},
	{"Shuffle", 4391208058},
	{"Hakari Dance", 122147154162464},
	{"Sidekicks - George Ezra", 10370922566},
	{"Bodybuilder", 3994130516},
	{"Tommy - Archer", 13823339506},
	{"Agree", 4849487550},
	{"[BEST] Chinese Military Dance Pose", 131258378669186},
	{"Zero Two Dance V2", 95385842020103},
	{"Power Blast", 4849497510},
	{"Bone Chillin' Bop", 15123050663},
	{"Skibidi Toilet - Titan Speakerman Laser Spin", 103102322875221},
	{"Invisible", 110348711077449},
	{"Fairy sit floating anime girl pose", 132152702263080},
	{"WISH NLE", 125783279336153},
	{"Zombie Run", 138431313591911},
}

local CatalogBundles = {
	{name="Rthro Animation Package",idle=2510235063,walk=2510242378,run=2510238627,jump=2510236649,fall=2510233257,climb=2510230574,swim=2510240941},
	{name="Oldschool Animation Pack",idle=5319922112,walk=5319909330,run=5319900634,jump=5319917561,fall=5319914476,climb=5319931619,swim=5319927054},
	{name="Stylish Animation Pack",idle=619511648,walk=619512767,run=619512153,jump=619511974,fall=619511417,climb=619509955,swim=619512450},
	{name="Robot Animation Pack",idle=619521748,walk=619522849,run=619522386,jump=619522088,fall=619521521,climb=619521311,swim=619522642},
	{name="Toy Animation Pack",idle=973771666,walk=973767371,run=973766674,jump=973770652,fall=973768058,climb=973773170,swim=973772659},
	{name="adidas Community Animation Pack",idle=126354114956642,walk=106810508343012,run=124765145869332,jump=115715495289805,fall=93993406355955,climb=123695349157584,swim=106537993816942},
	{name="Zombie Animation Pack",idle=619535834,walk=619537468,run=619536621,jump=619536283,fall=619535616,climb=619535091,swim=619537096},
	{name="Mage Animation Package",idle=754637456,walk=754636298,run=754635032,jump=754637084,fall=754636589,climb=754639239,swim=754638471},
	{name="Cartoony Animation Package",idle=837011741,walk=837010234,run=837009922,jump=837011171,fall=837010685,climb=837013990,swim=837012509},
	{name="Bubbly Animation Package",idle=1018553897,walk=1018549681,run=1018548665,jump=1018553240,fall=1018552770,climb=1018554668,swim=1018554245},
	{name="Ninja Animation Package",idle=658832408,walk=658831143,run=658830056,jump=658832070,fall=658831500,climb=658833139,swim=658832807},
	{name="Wicked Popular Animation Pack",idle=101839542383818,walk=133304526526319,run=136276875045281,jump=130373407996664,fall=83937116921114,climb=135810009801094,swim=128475661806875},
	{name="Bold Animation Pack by e.l.f.",idle=16744209868,walk=16744219182,run=16744214662,jump=16744212581,fall=16744207822,climb=16744204409,swim=16744217055},
	{name="adidas Sports Animation Pack",idle=18538150608,walk=18538146480,run=18538133604,jump=18538153691,fall=18538164337,climb=18538170170,swim=18538158932},
	{name="Superhero Animation Pack",idle=619528125,walk=619529601,run=619528716,jump=619528412,fall=619527817,climb=619527470,swim=619529095},
	{name="adidas aura animation pack",idle=73137983344853,walk=75183215343859,run=123973978164540,jump=129527230938281,fall=99457463463495,climb=140398319728398,swim=119007025452432},
	{name="Elder Animation Package",idle=892268340,walk=892267099,run=892265784,jump=892267917,fall=892267521,climb=892269341,swim=892268710},
	{name="Vampire Animation Pack",idle=1113742618,walk=1113741192,run=1113740510,jump=1113742359,fall=1113742092,climb=1113743239,swim=1113742944},
	{name="Catwalk Glam Animation Pack by e.l.f.",idle=101279640971758,walk=103190462987721,run=75036746190467,jump=138641066989023,fall=72706690305027,climb=104741822987331,swim=112231179705221},
	{name="Levitation Animation Pack",idle=619542203,walk=619544080,run=619543231,jump=619542888,fall=619541867,climb=619541458,swim=619543721},
	{name="Werewolf Animation Pack",idle=1113752682,walk=1113751657,run=1113750642,jump=1113752285,fall=1113751889,climb=1113754738,swim=1113752975},
	{name="Astronaut Animation Pack",idle=1090133099,walk=1090131576,run=1090130630,jump=1090132507,fall=1090132063,climb=1090134016,swim=1090133583},
	{name="No Boundaries Animation Pack by Walmart",idle=18755930927,walk=18755942776,run=18755933883,jump=18755925411,fall=18755922352,climb=18755919175,swim=18755938274},
	{name="Amazon Unboxed Animation Pack",idle=82219139681769,walk=128339543796138,run=114998633936467,jump=110418911914024,fall=125108870423182,climb=117011755848398,swim=137392271797713},
	{name="Glow Motion Animation Pack",idle=72213510878866,walk=124733969277188,run=91745899537026,jump=126137138096765,fall=76868289213402,climb=122281742555667,swim=78813763153341},
	{name="Knight Animation Package",idle=734327140,walk=734326330,run=734325948,jump=734326930,fall=734326679,climb=734329002,swim=734327363},
	{name="Cute Kawaii",idle=87378581612013,walk=134893286312907,run=114496981964667,jump=78753669029804,fall=78668034869322,climb=114544880037945,swim=77472834006636},
	{name="Jolly Animation Pack",idle=121468276202179,walk=83096586914276,run=71971990553119,jump=86777047181866,fall=83063007119941,climb=73563861115457,swim=71637541197973},
	{name="Pirate Animation Package",idle=837024662,walk=837023892,run=837023444,jump=837024350,fall=837024147,climb=837025325,swim=837025054},
	{name="Endless Aura Floating Pack",idle=75638427965557,walk=131290152729043,run=77610456891399,jump=74451563346167,fall=74203422263286,climb=116293937663140,swim=110044773049875},
	{name="Victoria Model",idle=103718214826066,walk=116254697237169,run=123079125703048,jump=91133124065771,fall=74672131231886,climb=72034200995655,swim=121980654863805},
	{name="👼 Angel (Floating)",idle=138791542100078,walk=98178584535094,run=120880326870608,jump=140709061221147,fall=98791635084597,climb=132683235998205,swim=133193009842625},
	{name="Billie Eilish Animation Pack",idle=82009039247070,walk=74056522836252,run=107895705891639,jump=114806832298003,fall=132771121298158,climb=95937554524959,swim=78340083978503},
	{name="Annoying Mini Me Animation Pack",idle=118862283492023,walk=123499402060535,run=108064018869475,jump=77719056586289,fall=81914368217933,climb=122736580472463,swim=133063333973854},
	{name="Cute Bouncy",idle=112758171987743,walk=105398643971664,run=81980688988481,jump=95845383984913,fall=91206221270256,climb=77455242814172,swim=137674505873151},
	{name="Bicyclist / Bike",idle=110301614683999,walk=78201729008814,run=82563400820481,jump=107759406184171,fall=116348378285841,climb=106713991255001,swim=77327275394482},
	{name="Doll 3.0",idle=109401010312897,walk=73488864835464,run=90126309265051,jump=118036998124357,fall=99977942446739,climb=86104031977265,swim=133772806040245},
	{name="KATSEYE Animation Pack",idle=125286451593779,walk=105967194765350,run=140179859838109,jump=121868657321572,fall=84737112249504,climb=130399277423748,swim=87465102258861},
	{name="Wicked \"Dancing Through Life\" Animation Pack",idle=82682578794949,walk=94133616443608,run=79789194522561,jump=111157411630082,fall=124742764102674,climb=123509187015792,swim=135050138303161},
	{name="Cute",idle=73073438542366,walk=87016985886252,run=103569388072604,jump=126765807132662,fall=74500938515101,climb=130431162972600,swim=112736233576006},
	{name="Zombie Animation V1",idle=99683684875874,walk=93573919758577,run=118223426835901,jump=117775165215292,fall=126356736613041,climb=73917242953119,swim=75615514809696},
	{name="It-Girl Essential Model Anim Bundle",idle=120992094851618,walk=90277175857099,run=111476936032056,jump=112646876784472,fall=125665759397426,climb=129595215811160,swim=114352975745413},
	{name="Cute Wave Animation Pack",idle=110604733161954,walk=105983703270796,run=132565671235504,jump=75211096170063,fall=88582791671646,climb=134283157573581,swim=72620812593886},
	{name="Cute Joy",idle=106422977106635,walk=84929464233480,run=136095340410517,jump=91003269917350,fall=99857206072384,climb=92360639959809,swim=83689554087147},
	{name="Cute Sit",idle=110542674051174,walk=118167050072619,run=113254670339077,jump=124327113511763,fall=99664258493491,climb=125102831404256,swim=112149520105094},
	{name="Realistic Male 01",idle=114822686413694,walk=139525865069063,run=130062168996362,jump=90526784917601,fall=88683402647046,climb=94323572155517,swim=83944244201171},
	{name="R6 Modern",idle=104406060298008,walk=124988819613327,run=99901926147031,jump=116343198036897,fall=129580654694779,climb=110907985002120,swim=99928806802401},
	{name="R6 Survivor Animation Pack",idle=79575948465396,walk=127283838990258,run=132471521372294,jump=137934973717401,fall=107615688046955,climb=111862482779638,swim=138445851536606},
	{name="Chill Boy",idle=79638430446468,walk=125935884379030,run=140668178711040,jump=121044668035612,fall=90121153486837,climb=107026478538282,swim=74464049474878},
	{name="Competent",idle=119086399545479,walk=123321628856372,run=121093676807537,jump=97770192168063,fall=93095471463296,climb=97137023603110,swim=76929827202134},
	{name="cutesy chibi animation pack",idle=103179664605636,walk=103849563001453,run=136485344017634,jump=85211239912050,fall=110743159760232,climb=140486275218961,swim=121372042956337},
	{name="Cute Animation Pack",idle=102526860241644,walk=129081631925429,run=106225307541637,jump=118216190885024,fall=120436889637318,climb=83450718624718,swim=102260064079692},
	{name="It-Girl Diva Model Anim Bundle",idle=80494300854973,walk=82957409029972,run=128240121430408,jump=125072972081311,fall=74013738186250,climb=81815597656897,swim=82440401004480},
	{name="Kawaii Cute Girly Animation Pack",idle=111249376072333,walk=73636981266788,run=131576761090801,jump=125116610868743,fall=106910927390939,climb=133959656651864,swim=104067918460960},
	{name="Mini Me Animation Animation Pack",idle=106089150684940,walk=116237551178158,run=104913000423601,jump=133780000255900,fall=79041695698101,climb=104828442123637,swim=83799110138560},
	{name="Kawaii Animation Pack",idle=84721389105549,walk=79177448240579,run=71632541042172,jump=105876388602982,fall=137590039087467,climb=76215614145945,swim=92467188495424},
	{name="Cool Emo Aura",idle=127580418054168,walk=91102198537347,run=77210591876650,jump=123882301747791,fall=95117093930538,climb=131813760681065,swim=95685828345272},
	{name="Nonchalant Animation Pack",idle=107123120166007,walk=125611743000994,run=88865794201668,jump=107221788639672,fall=118450647827858,climb=119095716889455,swim=96444605185114},
	{name="Dizzy Animation Pack",idle=137255148783720,walk=81054479341998,run=105873418863090,jump=121811306911133,fall=78281355074909,climb=117513930450845,swim=97259493650901},
}

------------------------------------------------------------------ SLOTURI & RESOLVER
-- {cheie, nume afisat, folder in Animate, nume Animation, cheie bundle}
local Slots = {
	{"idle1", "Idle 1", "idle", "Animation1", "idle"},
	{"idle2", "Idle 2", "idle", "Animation2", "idle"},
	{"walk", "Walk", "walk", "WalkAnim", "walk"},
	{"run", "Run", "run", "RunAnim", "run"},
	{"jump", "Jump", "jump", "JumpAnim", "jump"},
	{"fall", "Fall", "fall", "FallAnim", "fall"},
	{"climb", "Climb", "climb", "ClimbAnim", "climb"},
	{"swim", "Swim", "swim", "Swim", "swim"},
	{"swimidle", "Swim Idle", "swimidle", "SwimIdle", "swim"},
}

local RawIds = {}
for _, pk in ipairs(ClassicPacks) do
	for _, s in ipairs(Slots) do
		RawIds[tostring(pk[s[1]])] = true
	end
end
for _, e in ipairs(DefaultEmotes) do
	RawIds[tostring(e[2])] = true
end

local assetCache = {}
local emoteCache = {}
local bundleCache = {}

local function resolveAsset(id, silent)
	local num = tostring(id):match("%d+")
	if not num then return nil end
	if assetCache[num] then return assetCache[num] end

	local rbxId = "rbxassetid://" .. num
	if type(game.GetObjects) == "function" then
		local ok, objs = pcall(function()
			return game:GetObjects(rbxId)
		end)
		if ok and type(objs) == "table" and objs[1] then
			assetCache[num] = objs
			return objs
		end
	end

	local ok2, obj = pcall(function()
		return InsertService:LoadLocalAsset(rbxId)
	end)
	if ok2 and obj then
		local list = {obj}
		assetCache[num] = list
		return list
	end

	if not silent then
		notify("Executorul tau nu suporta GetObjects")
	end
	return nil
end

local function findFirstAnimId(objs)
	if not objs then return nil end
	for _, root in ipairs(objs) do
		if root:IsA("Animation") and root.AnimationId ~= "" then
			return root.AnimationId
		end
		for _, d in ipairs(root:GetDescendants()) do
			if d:IsA("Animation") and d.AnimationId ~= "" then
				return d.AnimationId
			end
		end
	end
	return nil
end

local function resolveEmote(input)
	local num = tostring(input):match("%d+")
	if not num then return nil end
	if RawIds[num] then return "rbxassetid://" .. num end
	if emoteCache[num] then return emoteCache[num] end

	local objs = resolveAsset(num, false)
	local found = findFirstAnimId(objs)
	local result = found or ("rbxassetid://" .. num)
	if found then
		emoteCache[num] = result
	end
	return result
end

local function resolveSlotId(input, slotKey)
	local num = tostring(input):match("%d+")
	if not num then return nil end
	if RawIds[num] then return "rbxassetid://" .. num end

	local objs = resolveAsset(num, false)
	if not objs then
		return "rbxassetid://" .. num
	end

	local wantedParent = slotKey
	if slotKey == "idle1" or slotKey == "idle2" then
		wantedParent = "idle"
	end

	for _, root in ipairs(objs) do
		for _, d in ipairs(root:GetDescendants()) do
			if d:IsA("Animation") and d.AnimationId ~= "" then
				local pName = d.Parent and string.lower(d.Parent.Name) or ""
				if pName == wantedParent then
					if slotKey == "idle1" and string.lower(d.Name) == "animation1" then
						return d.AnimationId
					elseif slotKey == "idle2" and string.lower(d.Name) == "animation2" then
						return d.AnimationId
					elseif slotKey ~= "idle1" and slotKey ~= "idle2" then
						return d.AnimationId
					end
				end
			end
		end
	end

	local first = findFirstAnimId(objs)
	return first or ("rbxassetid://" .. num)
end

local BundleAssetKeys = {"idle", "walk", "run", "jump", "fall", "climb", "swim"}

local function resolveBundle(entry)
	local key = table.concat({
		tostring(entry.idle or 0),
		tostring(entry.walk or 0),
		tostring(entry.run or 0),
		tostring(entry.jump or 0),
		tostring(entry.fall or 0),
		tostring(entry.climb or 0),
		tostring(entry.swim or 0),
	}, ":")
	if bundleCache[key] then return bundleCache[key] end

	local resolved = {}
	local anyLoaded = false

	local function assignFallback(slotKey, animId)
		if slotKey == "idle" then
			if not resolved.idle1 then
				resolved.idle1 = animId
			elseif not resolved.idle2 then
				resolved.idle2 = animId
			end
		else
			if not resolved[slotKey] then
				resolved[slotKey] = animId
			end
		end
	end

	for _, slotKey in ipairs(BundleAssetKeys) do
		local assetId = entry[slotKey]
		if assetId then
			local objs = resolveAsset(assetId, true)
			if objs then
				anyLoaded = true
				local anims = {}
				for _, root in ipairs(objs) do
					if root:IsA("Animation") and root.AnimationId ~= "" then
						table.insert(anims, root)
					end
					for _, d in ipairs(root:GetDescendants()) do
						if d:IsA("Animation") and d.AnimationId ~= "" then
							table.insert(anims, d)
						end
					end
				end

				for _, anim in ipairs(anims) do
					local pName = anim.Parent and string.lower(anim.Parent.Name) or ""
					if pName == "idle" then
						local aName = string.lower(anim.Name)
						if aName == "animation1" then
							resolved.idle1 = anim.AnimationId
						elseif aName == "animation2" then
							resolved.idle2 = anim.AnimationId
						elseif not resolved.idle1 then
							resolved.idle1 = anim.AnimationId
						elseif not resolved.idle2 then
							resolved.idle2 = anim.AnimationId
						end
					elseif pName == "walk" or pName == "run" or pName == "jump" or pName == "fall" or pName == "climb" or pName == "swim" or pName == "swimidle" then
						resolved[pName] = anim.AnimationId
					else
						assignFallback(slotKey, anim.AnimationId)
					end
				end
			end
		end
	end

	if not anyLoaded then
		notify("Executorul tau nu suporta GetObjects")
		return nil
	end

	if resolved.idle1 and not resolved.idle2 then
		resolved.idle2 = resolved.idle1
	end
	if resolved.swim and not resolved.swimidle then
		resolved.swimidle = resolved.swim
	end

	bundleCache[key] = resolved
	return resolved
end

------------------------------------------------------------------ LOGICA ANIMATII & EMOTE
local Current = {}
local function getHum(c)
	return c and c:FindFirstChildOfClass("Humanoid")
end

local function applyAnims(char)
	char = char or LP.Character
	local hum = getHum(char)
	if not hum then return end
	local animate = char:FindFirstChild("Animate")
	if not animate then
		notify("Nu exista scriptul Animate (joc cu sistem custom)")
		return
	end
	if hum.RigType ~= Enum.HumanoidRigType.R15 then
		notify("Personaj R6 - bundle-urile merg doar pe R15")
	end
	for _, s in ipairs(Slots) do
		local id = Current[s[1]]
		if id then
			local f = animate:FindFirstChild(s[3])
			local a = f and f:FindFirstChild(s[4])
			if a then
				a.AnimationId = id
			end
		end
	end
	local animator = hum:FindFirstChildOfClass("Animator") or hum
	for _, t in ipairs(animator:GetPlayingAnimationTracks()) do
		t:Stop(0)
	end
	animate.Disabled = true
	task.wait()
	animate.Disabled = false
end

local emoteTrack, emoteConn
local loopEmote = false
local emoteSeq = 0
local bundleSeq = 0

local function stopEmote()
	if emoteTrack then
		emoteTrack:Stop(0.2)
		emoteTrack = nil
	end
	if emoteConn then
		emoteConn:Disconnect()
		emoteConn = nil
	end
end

local function playEmote(input, isRaw)
	local num = tostring(input):match("%d+")
	if not num then
		notify("ID invalid")
		return
	end

	emoteSeq = emoteSeq + 1
	local mySeq = emoteSeq

	local id
	if isRaw or RawIds[num] then
		id = "rbxassetid://" .. num
	else
		id = resolveEmote(num)
	end
	if mySeq ~= emoteSeq then return end
	if not id then
		notify("ID invalid")
		return
	end

	local hum = getHum(LP.Character)
	if not hum then return end
	stopEmote()

	local animator = hum:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = hum
	end
	local anim = Instance.new("Animation")
	anim.AnimationId = id

	local ok, track = pcall(animator.LoadAnimation, animator, anim)
	if not ok or not track then
		notify("Nu pot incarca animatia")
		return
	end

	track.Priority = Enum.AnimationPriority.Action
	track.Looped = loopEmote
	track:Play(0.1)
	emoteTrack = track

	task.delay(0.3, function()
		if emoteTrack ~= track then return end
		emoteConn = hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			if hum.MoveDirection.Magnitude > 0 then
				stopEmote()
			end
		end)
	end)
end

------------------------------------------------------------------ HTTP / CAUTARE CATALOG
local function httpGet(url)
	local ok, res = pcall(function()
		return game:HttpGet(url)
	end)
	if ok and type(res) == "string" and res ~= "" then
		return res
	end
	local reqFn = request or http_request or (syn and syn.request) or (http and http.request)
	if type(reqFn) == "function" then
		local ok2, resp = pcall(reqFn, {Url = url, Method = "GET"})
		if ok2 and type(resp) == "table" and type(resp.Body) == "string" and resp.Body ~= "" then
			if not resp.StatusCode or (resp.StatusCode >= 200 and resp.StatusCode < 300) then
				return resp.Body
			end
		end
	end
	return nil
end

local BundleSlotOrder = {"idle", "walk", "run", "jump", "fall", "climb", "swim"}
local BundleSlotPatterns = {
	idle  = {"idle", "inatividade"},
	walk  = {"walk", "caminhada"},
	run   = {"run", "corrida"},
	jump  = {"jump", "salto"},
	fall  = {"fall", "queda"},
	climb = {"climb", "escalada"},
	swim  = {"swim", "nado"},
}

local function matchBundleSlot(assetName)
	local low = string.lower(tostring(assetName or ""))
	for _, slot in ipairs(BundleSlotOrder) do
		for _, kw in ipairs(BundleSlotPatterns[slot]) do
			if string.find(low, kw, 1, true) then
				return slot
			end
		end
	end
	return nil
end

local function buildBundleEntry(name, items)
	local assets = {}
	for _, it in ipairs(items or {}) do
		if it.type == "Asset" and it.id then
			table.insert(assets, it)
		end
	end
	if #assets < 7 then return nil end

	local entry = {name = name, isClassic = false}
	local usedIdx = {}

	for idx, it in ipairs(assets) do
		local slot = matchBundleSlot(it.name)
		if slot and not entry[slot] then
			entry[slot] = it.id
			usedIdx[idx] = true
		end
	end

	local rem = {}
	for idx, it in ipairs(assets) do
		if not usedIdx[idx] then
			table.insert(rem, it)
		end
	end
	local remPtr = 1
	for _, slot in ipairs(BundleSlotOrder) do
		if not entry[slot] and rem[remPtr] then
			entry[slot] = rem[remPtr].id
			remPtr = remPtr + 1
		end
	end

	for _, slot in ipairs(BundleSlotOrder) do
		if not entry[slot] then return nil end
	end
	return entry
end

------------------------------------------------------------------ UI
local BG     = Color3.fromRGB(25, 25, 30)
local PANEL  = Color3.fromRGB(40, 40, 48)
local DARK   = Color3.fromRGB(32, 32, 38)
local ACCENT = Color3.fromRGB(0, 150, 255)
local WHITE  = Color3.new(1, 1, 1)
local GREY   = Color3.fromRGB(160, 160, 170)

local order = 0
local function new(class, props, parent)
	local o = Instance.new(class)
	for k, v in pairs(props or {}) do
		o[k] = v
	end
	if o:IsA("GuiObject") then
		order = order + 1
		o.LayoutOrder = order
	end
	if parent then
		o.Parent = parent
	end
	return o
end

local function corner(o, r)
	new("UICorner", {CornerRadius = UDim.new(0, r or 6)}, o)
end

local function padText(o, px)
	local p = px or 5
	new("UIPadding", {PaddingLeft = UDim.new(0, p), PaddingRight = UDim.new(0, p)}, o)
end

local function button(text, parent, props)
	local b = new("TextButton", {
		Text = text,
		BackgroundColor3 = PANEL,
		TextColor3 = WHITE,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextTruncate = Enum.TextTruncate.AtEnd,
		BorderSizePixel = 0,
	}, parent)
	corner(b)
	padText(b, 5)
	for k, v in pairs(props or {}) do
		b[k] = v
	end
	return b
end

local gui = new("ScreenGui", {
	Name = "AnimMenuGui",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})

local function tryParent(p)
	return pcall(function()
		local old = p:FindFirstChild("AnimMenuGui")
		if old then old:Destroy() end
		gui.Parent = p
	end)
end

local parented = false
if gethui then
	local ok, h = pcall(gethui)
	if ok and h then
		parented = tryParent(h)
	end
end
if not parented then
	parented = tryParent(game:GetService("CoreGui"))
end
if not parented then
	tryParent(LP:WaitForChild("PlayerGui"))
end

local main = new("Frame", {
	Size = UDim2.fromOffset(520, 430),
	Position = UDim2.new(0.5, -260, 0.5, -215),
	BackgroundColor3 = BG,
	BorderSizePixel = 0,
	Active = true,
}, gui)
corner(main, 8)

local top = new("Frame", {
	Size = UDim2.new(1, 0, 0, 32),
	BackgroundColor3 = PANEL,
	BorderSizePixel = 0,
}, main)
corner(top, 8)

new("TextLabel", {
	Size = UDim2.new(1, -46, 1, 0),
	Position = UDim2.fromOffset(12, 0),
	BackgroundTransparency = 1,
	Text = "Animation Menu   |   Alt = arata / ascunde",
	TextColor3 = WHITE,
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextXAlignment = Enum.TextXAlignment.Left,
}, top)

local closeBtn = button("X", top, {
	Size = UDim2.fromOffset(26, 24),
	Position = UDim2.new(1, -30, 0, 4),
	BackgroundColor3 = DARK,
	Font = Enum.Font.GothamBold,
})
closeBtn.MouseButton1Click:Connect(function()
	main.Visible = false
end)

do -- drag
	local dragging, dragStart, startPos
	top.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging, dragStart, startPos = true, i.Position, main.Position
			i.Changed:Connect(function()
				if i.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local d = i.Position - dragStart
			main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
end

local tabBar = new("Frame", {
	Size = UDim2.new(1, -16, 0, 30),
	Position = UDim2.fromOffset(8, 38),
	BackgroundTransparency = 1,
}, main)
new("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	Padding = UDim.new(0, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
}, tabBar)

local pages, tabs = {}, {}
local function showPage(name)
	for n, p in pairs(pages) do
		p.Visible = (n == name)
	end
	for n, b in pairs(tabs) do
		b.BackgroundColor3 = (n == name) and ACCENT or PANEL
	end
end

local tabNames = {"Bundle-uri", "Custom", "Emote-uri", "Cauta"}
for _, n in ipairs(tabNames) do
	pages[n] = new("ScrollingFrame", {
		Size = UDim2.new(1, -16, 1, -82),
		Position = UDim2.fromOffset(8, 74),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		Visible = false,
	}, main)
	tabs[n] = button(n, tabBar, {
		Size = UDim2.fromOffset(121, 30),
		Font = Enum.Font.GothamBold,
		TextSize = 13,
	})
	tabs[n].MouseButton1Click:Connect(function()
		showPage(n)
	end)
end

------------------------------------------------------------------ ALL PACKS + CUSTOM TAB
local AllPacks = {}
for _, pk in ipairs(ClassicPacks) do
	table.insert(AllPacks, pk)
end
for _, pk in ipairs(CatalogBundles) do
	pk.isClassic = false
	table.insert(AllPacks, pk)
end

local cp = pages["Custom"]
new("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, cp)

local rows = {}
for _, s in ipairs(Slots) do
	local slotKey = s[1]
	local bundleKey = s[5]
	local row = new("Frame", {Size = UDim2.new(1, -8, 0, 30), BackgroundTransparency = 1}, cp)
	new("TextLabel", {
		Size = UDim2.fromOffset(68, 30),
		BackgroundTransparency = 1,
		Text = s[2],
		TextColor3 = WHITE,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, row)

	local prev = button("<", row, {Size = UDim2.fromOffset(26, 30), Position = UDim2.fromOffset(70, 0), Font = Enum.Font.GothamBold})
	local lbl = new("TextLabel", {
		Size = UDim2.fromOffset(142, 30),
		Position = UDim2.fromOffset(98, 0),
		BackgroundColor3 = PANEL,
		Text = "-",
		TextColor3 = WHITE,
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, row)
	corner(lbl)
	padText(lbl, 4)

	local nxt = button(">", row, {Size = UDim2.fromOffset(26, 30), Position = UDim2.fromOffset(242, 0), Font = Enum.Font.GothamBold})
	local box = new("TextBox", {
		Size = UDim2.new(1, -274, 0, 30),
		Position = UDim2.fromOffset(274, 0),
		BackgroundColor3 = PANEL,
		Text = "",
		PlaceholderText = "ID animatie / catalog",
		PlaceholderColor3 = GREY,
		TextColor3 = WHITE,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		ClearTextOnFocus = false,
	}, row)
	corner(box)
	padText(box, 6)

	local idx = 0
	local selectedPack = nil

	local function setPack(i)
		idx = ((i - 1) % #AllPacks) + 1
		local pk = AllPacks[idx]
		selectedPack = pk
		lbl.Text = pk.name
		local val = pk.isClassic and pk[slotKey] or pk[bundleKey]
		box.Text = tostring(val or "")
	end

	prev.MouseButton1Click:Connect(function()
		setPack(idx == 0 and #AllPacks or (idx - 1))
	end)
	nxt.MouseButton1Click:Connect(function()
		setPack(idx + 1)
	end)

	rows[slotKey] = {
		box = box,
		set = setPack,
		getSelected = function(num)
			if selectedPack and not selectedPack.isClassic and tostring(selectedPack[bundleKey]) == tostring(num) then
				return selectedPack
			end
			return nil
		end,
	}
end

local applyBtn = button("Aplica animatiile", cp, {
	Size = UDim2.new(1, -8, 0, 34),
	BackgroundColor3 = ACCENT,
	Font = Enum.Font.GothamBold,
	TextSize = 13,
})
applyBtn.MouseButton1Click:Connect(function()
	task.spawn(function()
		local needsResolve = false
		for _, s in ipairs(Slots) do
			local num = rows[s[1]].box.Text:match("%d+")
			if num and not RawIds[num] then
				needsResolve = true
				break
			end
		end
		if needsResolve then
			notify("Se incarca animatiile...")
		end

		local resolvedBundles = {}
		for _, s in ipairs(Slots) do
			local slotKey = s[1]
			local num = rows[slotKey].box.Text:match("%d+")
			if num then
				if RawIds[num] then
					Current[slotKey] = "rbxassetid://" .. num
				else
					local pk = rows[slotKey].getSelected(num)
					if pk then
						if not resolvedBundles[pk] then
							resolvedBundles[pk] = resolveBundle(pk) or false
						end
						local rb = resolvedBundles[pk]
						if rb and rb[slotKey] then
							Current[slotKey] = rb[slotKey]
						end
					else
						Current[slotKey] = resolveSlotId(num, slotKey)
					end
				end
			end
		end
		applyAnims()
		notify("Animatii custom aplicate")
	end)
end)

local resetBtn = button("Reset la Default", cp, {Size = UDim2.new(1, -8, 0, 30), TextSize = 13})
resetBtn.MouseButton1Click:Connect(function()
	for _, s in ipairs(Slots) do
		Current[s[1]] = "rbxassetid://" .. ClassicPacks[1][s[1]]
		rows[s[1]].set(1)
	end
	applyAnims()
	notify("Resetat la Default R15")
end)

------------------------------------------------------------------ BUNDLE APPLY HELPER
local function applyBundleEntry(pk, packIndex)
	if pk.isClassic then
		for _, s in ipairs(Slots) do
			Current[s[1]] = "rbxassetid://" .. pk[s[1]]
			if packIndex then
				rows[s[1]].set(packIndex)
			end
		end
		applyAnims()
		notify("Bundle aplicat: " .. pk.name)
		return
	end

	bundleSeq = bundleSeq + 1
	local mySeq = bundleSeq
	notify("Se incarca " .. pk.name .. "...")

	task.spawn(function()
		local resolved = resolveBundle(pk)
		if mySeq ~= bundleSeq or not resolved then return end

		for _, s in ipairs(Slots) do
			local animId = resolved[s[1]]
			if animId then
				Current[s[1]] = animId
			end
			if packIndex then
				rows[s[1]].set(packIndex)
			end
		end
		applyAnims()
		notify("Bundle aplicat: " .. pk.name)
	end)
end

------------------------------------------------------------------ TAB: BUNDLE-URI
local bp = pages["Bundle-uri"]
new("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}, bp)

local bundleFilter = new("TextBox", {
	Size = UDim2.new(1, -8, 0, 28),
	BackgroundColor3 = PANEL,
	Text = "",
	PlaceholderText = "Filtreaza bundle-uri...",
	PlaceholderColor3 = GREY,
	TextColor3 = WHITE,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	ClearTextOnFocus = false,
}, bp)
corner(bundleFilter)
padText(bundleFilter, 8)

local popHeader = new("TextLabel", {
	Size = UDim2.new(1, -8, 0, 20),
	BackgroundTransparency = 1,
	Text = "Populare (catalog)",
	TextColor3 = GREY,
	Font = Enum.Font.GothamBold,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
}, bp)

local popGrid = new("Frame", {
	Size = UDim2.new(1, -8, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
}, bp)
new("UIGridLayout", {
	CellSize = UDim2.fromOffset(118, 30),
	CellPadding = UDim2.fromOffset(6, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
}, popGrid)

local clsHeader = new("TextLabel", {
	Size = UDim2.new(1, -8, 0, 20),
	BackgroundTransparency = 1,
	Text = "Clasice",
	TextColor3 = GREY,
	Font = Enum.Font.GothamBold,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
}, bp)

local clsGrid = new("Frame", {
	Size = UDim2.new(1, -8, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
}, bp)
new("UIGridLayout", {
	CellSize = UDim2.fromOffset(118, 30),
	CellPadding = UDim2.fromOffset(6, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
}, clsGrid)

local popBtns, clsBtns = {}, {}
for i, pk in ipairs(CatalogBundles) do
	local packIdx = #ClassicPacks + i
	local b = button(pk.name, popGrid)
	b.MouseButton1Click:Connect(function()
		applyBundleEntry(pk, packIdx)
	end)
	table.insert(popBtns, {btn = b, low = string.lower(pk.name)})
end

for i, pk in ipairs(ClassicPacks) do
	local b = button(pk.name, clsGrid)
	b.MouseButton1Click:Connect(function()
		applyBundleEntry(pk, i)
	end)
	table.insert(clsBtns, {btn = b, low = string.lower(pk.name)})
end

bundleFilter:GetPropertyChangedSignal("Text"):Connect(function()
	local q = string.lower(bundleFilter.Text)
	local popVis = false
	for _, it in ipairs(popBtns) do
		local v = (q == "" or string.find(it.low, q, 1, true) ~= nil)
		it.btn.Visible = v
		if v then popVis = true end
	end
	popHeader.Visible = popVis
	popGrid.Visible = popVis

	local clsVis = false
	for _, it in ipairs(clsBtns) do
		local v = (q == "" or string.find(it.low, q, 1, true) ~= nil)
		it.btn.Visible = v
		if v then clsVis = true end
	end
	clsHeader.Visible = clsVis
	clsGrid.Visible = clsVis
end)

------------------------------------------------------------------ TAB: EMOTE-URI
local ep = pages["Emote-uri"]
new("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}, ep)

local eHead = new("Frame", {Size = UDim2.new(1, -8, 0, 30), BackgroundTransparency = 1}, ep)
local ebox = new("TextBox", {
	Size = UDim2.new(1, -214, 1, 0),
	BackgroundColor3 = PANEL,
	Text = "",
	PlaceholderText = "ID emote (animatie sau catalog)",
	PlaceholderColor3 = GREY,
	TextColor3 = WHITE,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	ClearTextOnFocus = false,
}, eHead)
corner(ebox)
padText(ebox, 6)

button("Play", eHead, {
	Size = UDim2.fromOffset(60, 30),
	Position = UDim2.new(1, -208, 0, 0),
	BackgroundColor3 = ACCENT,
	Font = Enum.Font.GothamBold,
}).MouseButton1Click:Connect(function()
	task.spawn(function()
		playEmote(ebox.Text, false)
	end)
end)

button("Stop", eHead, {
	Size = UDim2.fromOffset(60, 30),
	Position = UDim2.new(1, -142, 0, 0),
}).MouseButton1Click:Connect(stopEmote)

local loopBtn = button("Loop: OFF", eHead, {
	Size = UDim2.fromOffset(76, 30),
	Position = UDim2.new(1, -76, 0, 0),
})
loopBtn.MouseButton1Click:Connect(function()
	loopEmote = not loopEmote
	loopBtn.Text = loopEmote and "Loop: ON" or "Loop: OFF"
	if emoteTrack then
		emoteTrack.Looped = loopEmote
	end
end)

local emoteFilter = new("TextBox", {
	Size = UDim2.new(1, -8, 0, 28),
	BackgroundColor3 = PANEL,
	Text = "",
	PlaceholderText = "Filtreaza emote-uri...",
	PlaceholderColor3 = GREY,
	TextColor3 = WHITE,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	ClearTextOnFocus = false,
}, ep)
corner(emoteFilter)
padText(emoteFilter, 8)

local emoteGrid = new("Frame", {
	Size = UDim2.new(1, -8, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
}, ep)
new("UIGridLayout", {
	CellSize = UDim2.fromOffset(118, 30),
	CellPadding = UDim2.fromOffset(6, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
}, emoteGrid)

local emoteBtns = {}
local function addEmoteBtn(name, id, isRaw)
	local b = button(name, emoteGrid)
	b.MouseButton1Click:Connect(function()
		task.spawn(function()
			playEmote(id, isRaw)
		end)
	end)
	table.insert(emoteBtns, {btn = b, low = string.lower(name)})
end

for _, e in ipairs(DefaultEmotes) do
	addEmoteBtn(e[1], e[2], true)
end
for _, e in ipairs(CatalogEmotes) do
	addEmoteBtn(e[1], e[2], false)
end

emoteFilter:GetPropertyChangedSignal("Text"):Connect(function()
	local q = string.lower(emoteFilter.Text)
	for _, it in ipairs(emoteBtns) do
		it.btn.Visible = (q == "" or string.find(it.low, q, 1, true) ~= nil)
	end
end)

------------------------------------------------------------------ TAB: CAUTA
local sp = pages["Cauta"]
new("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}, sp)

local sHead = new("Frame", {Size = UDim2.new(1, -8, 0, 30), BackgroundTransparency = 1}, sp)
local searchBox = new("TextBox", {
	Size = UDim2.new(1, -168, 1, 0),
	BackgroundColor3 = PANEL,
	Text = "",
	PlaceholderText = "Nume emote sau bundle...",
	PlaceholderColor3 = GREY,
	TextColor3 = WHITE,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	ClearTextOnFocus = false,
}, sHead)
corner(searchBox)
padText(searchBox, 6)

local searchMode = "Emote"
local modeBtn = button("Mod: Emote", sHead, {
	Size = UDim2.fromOffset(82, 30),
	Position = UDim2.new(1, -162, 0, 0),
	Font = Enum.Font.GothamBold,
})
modeBtn.MouseButton1Click:Connect(function()
	searchMode = (searchMode == "Emote") and "Bundle" or "Emote"
	modeBtn.Text = "Mod: " .. searchMode
end)

local goBtn = button("Cauta", sHead, {
	Size = UDim2.fromOffset(74, 30),
	Position = UDim2.new(1, -74, 0, 0),
	BackgroundColor3 = ACCENT,
	Font = Enum.Font.GothamBold,
})

local statusLbl = new("TextLabel", {
	Size = UDim2.new(1, -8, 0, 20),
	BackgroundTransparency = 1,
	Text = "Scrie un cuvant si apasa Cauta",
	TextColor3 = GREY,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
}, sp)

local searchGrid = new("Frame", {
	Size = UDim2.new(1, -8, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
}, sp)
new("UIGridLayout", {
	CellSize = UDim2.fromOffset(118, 30),
	CellPadding = UDim2.fromOffset(6, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
}, searchGrid)

local searchSeq = 0
local function clearSearchGrid()
	for _, ch in ipairs(searchGrid:GetChildren()) do
		if ch:IsA("GuiObject") then
			ch:Destroy()
		end
	end
end

local function doSearch()
	searchSeq = searchSeq + 1
	local mySeq = searchSeq
	local mode = searchMode
	local kw = searchBox.Text:match("^%s*(.-)%s*$") or ""

	clearSearchGrid()
	statusLbl.Text = "Se cauta..."

	task.spawn(function()
		local subcat = (mode == "Bundle") and 38 or 39
		local url = "https://catalog.roblox.com/v1/search/items/details?Category=12&Subcategory=" .. subcat .. "&SortType=2&Limit=30"
		if kw ~= "" then
			url = url .. "&Keyword=" .. HttpService:UrlEncode(kw)
		end

		local body = httpGet(url)
		if mySeq ~= searchSeq then return end
		if not body then
			statusLbl.Text = "Cautarea nu e suportata de executor"
			notify("Cautarea nu e suportata de executor")
			return
		end

		local okDec, decoded = pcall(HttpService.JSONDecode, HttpService, body)
		if not okDec or type(decoded) ~= "table" or type(decoded.data) ~= "table" then
			statusLbl.Text = "Eroare la citirea rezultatelor"
			return
		end

		local items = decoded.data
		if #items == 0 then
			statusLbl.Text = "Niciun rezultat gasit"
			return
		end

		if mode == "Emote" then
			statusLbl.Text = "Rezultate Emote: " .. #items
			for _, it in ipairs(items) do
				if it.id and it.name then
					local btn = button(it.name, searchGrid)
					btn.MouseButton1Click:Connect(function()
						task.spawn(function()
							playEmote(it.id, false)
						end)
					end)
				end
			end
		else
			local idList = {}
			local nameById = {}
			for _, it in ipairs(items) do
				if it.id and it.name then
					table.insert(idList, tostring(it.id))
					nameById[tostring(it.id)] = it.name
				end
			end

			local detailsById = {}
			for i = 1, #idList, 19 do
				local chunk = {}
				for j = i, math.min(i + 18, #idList) do
					table.insert(chunk, idList[j])
				end
				local dUrl = "https://catalog.roblox.com/v1/bundles/details?bundleIds=" .. table.concat(chunk, ",")
				local dBody = httpGet(dUrl)
				if mySeq ~= searchSeq then return end
				if dBody then
					local okD, dDecoded = pcall(HttpService.JSONDecode, HttpService, dBody)
					if okD and type(dDecoded) == "table" then
						for _, b in ipairs(dDecoded) do
							if b.id then
								detailsById[tostring(b.id)] = b
							end
						end
					end
				end
			end

			local count = 0
			for _, idStr in ipairs(idList) do
				local d = detailsById[idStr]
				if d and d.items then
					local entry = buildBundleEntry(nameById[idStr] or d.name or "Bundle", d.items)
					if entry then
						count = count + 1
						local btn = button(entry.name, searchGrid)
						btn.MouseButton1Click:Connect(function()
							applyBundleEntry(entry, nil)
						end)
					end
				end
			end
			statusLbl.Text = "Rezultate Bundle: " .. count
		end
	end)
end

goBtn.MouseButton1Click:Connect(doSearch)
searchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		doSearch()
	end
end)

showPage("Bundle-uri")

------------------------------------------------------------------ TOGGLE + RESPAWN
UIS.InputBegan:Connect(function(input)
	if UIS:GetFocusedTextBox() then return end
	if input.KeyCode == Enum.KeyCode.LeftAlt or input.KeyCode == Enum.KeyCode.RightAlt then
		main.Visible = not main.Visible
	end
end)

LP.CharacterAdded:Connect(function(c)
	stopEmote()
	if next(Current) then
		c:WaitForChild("Animate", 10)
		task.wait(1)
		applyAnims(c)
	end
end)

notify("Meniu incarcat - apasa Alt")

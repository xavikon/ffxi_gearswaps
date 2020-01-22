-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat','Regain')
	state.HybridMode:options('Normal','PDT')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 / Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
    gear.staff_dd = {name="Akademos",augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15'}}
	
	gear.obi_cure_back = "Tempered Cape +1"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	sets.Weapons = {main=gear.staff_dd,sub="Niobid Strap"}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells
       --FC:  Sub(2), Head(10), Ear1(1), Body(6), Hands(7), Back(3), Waist(3), Feet(7), Total: 39%
    sets.precast.FC = {sub="Clerisy Strap",
        head="Vanya Hood",ear1="Etiolation Earring",
        hands="Gende. Gages +1",
        back="Swith Cape",waist="Witful Belt",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkaro. Earring"})
       --FC: Back(8)  Total: 44%
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Pahtli cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Amalric Doublet",hands="Telchine Gloves",ring1="Mephitas's Ring",ring2="Mephitas's Ring +1",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
                --MB I: 10+5+5+11+10
--    sets.MagicBurst = {main=gear.staff_dd,neck="Mizu. Kubikazari",hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring",
--                       ear1="Static Earring",legs="Merlinic Shalwar",feet="Jhakri Pigaches +2"}

    sets.MagicBurst = {main=gear.stff_dd,sub="Enki Strap",range="",ammo="Dosis Tathlum",
                            head=gear.merlinic_burst_head,neck="Mizu. Kubikazari",ear1="Static earring",ear2="Barkaro. Earring",
                            body="Vedic coat",hands="Regal cuffs",ring1="Locus ring",ring2="Mujin band",
                            back="Bookworm's cape",waist="Channeler's stone",legs=gear.merlinic_burst_legs,feet="Inspirited boots"}
    
    --6485,6485
    --6523,6523
    sets.MagicBurst.Helix = {main=gear.stff_dd,sub="Enki Strap",range="",ammo="Dosis Tathlum",
                            head=gear.merlinic_burst_head,neck="Mizu. Kubikazari",ear1="Static earring",ear2="Barkaro. Earring",
                            body="Vedic coat",hands="Regal cuffs",ring1="Locus ring",ring2="Mujin band",
                            back="Bookworm's cape",waist="Channeler's stone",legs=gear.merlinic_burst_legs,feet="Inspirited boots"} --feet="Inspirited boots"
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
        sets.element.Fire = {waist = "Karin Obi"}
	sets.element.Ice = {waist="Hyorin Obi"}
	sets.element.Earth = {neck="Quanpur Necklace"}

    sets.midcast.FastRecast = {sub="Clerisy Strap",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
	--Cure Potency:  Head(10), Neck(2), Hands(10), Back(4), Boots(10)  (36%)
    sets.midcast.Cure = {main="Serenity",
        head="Vanya Hood",neck="Fylgja Torque",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Sirona's Ring",ring2="Solemn Ring",
        back="Tempered Cape",waist="Cascade Belt",legs="Chironic Hose",feet="Kaykaus Boots"}

    sets.midcast.LightWeatherCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Sirona's Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots"}
		
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Sirona's Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Recieved = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main="Oranyan",sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Debilis Medallion",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Haoma's Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {main="Oranyan",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Genmei Shield",head="Arbatel Bonnet +1"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Digni. Earring",
        body="Vanya Robe",hands=gear.chironic_enfeeble_hands,ring1="Kishar Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Uk'uxkaj Boots"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Digni. Earring",
        body="Vanya Robe",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear1="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {}

    sets.midcast.Kaustra = {}
		
    sets.midcast.Kaustra.Resistant = {}

    sets.midcast.Drain = {}
		
    sets.midcast.Drain.Resistant = {}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {}

    sets.midcast.Stun.Resistant = {}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main=gear.staff_dd,sub="Niobid strap",ammo="Kalboron Stone",
        head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Shiva Ring",ring2="Jhakri Ring",
        back="Lugh's Cape",waist="Channeler's Stone",legs="Jhakri Slops +1",feet="Jhakri pigaches +2"}

    sets.midcast['Elemental Magic'].Resistant = {main=gear.staff_dd,sub="Niobid strap",ammo="Kalboron Stone",
        head="Jhakri Coronal +1",neck="Erra pendant",ear1="Barkaro. Earring",ear2="Hermetic Earring",
        body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Shiva Ring",ring2="Jhakri Ring",
        back="Lugh's Cape",waist="Luminary sash",legs="Jhakri Slops +1",feet="Jhakri pigaches +2"}
		
    sets.midcast['Elemental Magic'].Proc = {}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Barkaro. Earring",ear2="Digni. Earring",hands="Amalric Gages"})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {main=gear.staff_dd,sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Barkaro. Earring",ear2="Digni. Earring",hands="Amalric Gages"})
	--sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages"})

        --2527 w/o food, 2531 w/pear crepe
        --2556 with stone
	sets.midcast.Helix = {main=gear.staff_dd,sub="Niobid strap",ammo="Dosis Tathlum",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
                                head="Mallquis chapeau +1",body="Mallquis saio +1",ring1="Shiva Ring",ring2="Jhakri Ring",waist="Channeler's Stone",
                                hands="Mallquis cuffs +1",feet="Mallquis clogs +1",back="Bookworm's Cape"}
	--
        
        
        --2965,2965
        --sets.midcast.Helix = {main=gear.staff_dd,sub="Niobid strap",ammo="Dosis Tathlum",
        --                        head="Mallquis chapeau +1",body="Mallquis saio +1",
        --                        hands="Mallquis cuffs +1",feet="Mallquis clogs +1",neck="Sanctity Necklace",back="Lugh's Cape"}
        
        
	sets.midcast.Helix.Resistant = {}
		
	sets.midcast.Helix.Proc = {}

	sets.midcast.Impact = {}


    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Blistering Sallet",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Fortified Ring",
        back="Solemnity Cape",waist="Isa Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    sets.idle.PDT = {main="Earth Staff", sub="Mensch Strap",ammo="Staunch Tathlum",
        head="Blistering Sallet",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Solemnity Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Fortified Ring",
        back="Solemnity Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque",ring2="Karieyh Ring"})
	sets.idle.Regain = set_combine(sets.idle, {ring2="Karieyh Ring"})

    -- Defense sets

    sets.defense.PDT = {main="Earth Staff", sub="Mensch Strap",ammo="Staunch Tathlum",
        head="Blistering Sallet",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Vrikodara Jupon",hands="Amalric gages",ring1="Patricius Ring",ring2="Fortified Ring",
        back="Solemnity Cape",waist="Isa Belt",legs="Assid. Pants +1",feet="Inspirited Boots"}

    sets.defense.MDT = {main="Earth Staff", sub="Mensch Strap",ammo="Staunch Tathlum",
        head="Blistering Sallet",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Vrikodara Jupon",hands="Amalric gages",ring1="Patricius Ring",ring2="Fortified Ring",
        back="Solemnity Cape",waist="Isa Belt",legs="Assid. Pants +1",feet="Inspirited Boots"}
		
    sets.defense.MEVA = {main="Oranyan",sub="Umbra Strap",ammo="Staunch Tathlum",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Merlinic Jubbah",hands="Amalric gages",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet="Inspirited Boots"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Terra's Staff", sub="Oneiros Grip",ammo="Staunch Tathlum",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end
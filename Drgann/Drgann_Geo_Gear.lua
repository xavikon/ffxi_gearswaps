-------------------------------------------------------
-------- Geomancer Notes ------------------------------
-------------------------------------------------------
--
-- When casting a Geo-spell from menu, after selecting your target, by holding alt and pushing arrow keys you can position your bubble in a different location.
-- Luopans have an innate -50% Damage Taken. Pet DT caps at 87.5%, meaning only 38% of Pet: Damage Taken is needed to cap.
--
--
-- Geomancy Job Abilities List
		-- Bolster(https://www.bg-wiki.com/bg/Bolster) -- Recast 1h, Increases Luopan HP and reduces perpetuation cost, double Geomancy potency(retroactive to Indi, not to Geo)
		-- Full Circle(https://www.bg-wiki.com/bg/Full_Circle) -- Recast 10s, Returns MP based on remaining HP of Luopan
		-- Lasting Emanation(https://www.bg-wiki.com/bg/Lasting_Emanation) -- Recast 5m, reduces amount of HP Luopan drains, shared cooldown with Ecliptic_Attrition
		-- Ecliptic Attrition(https://www.bg-wiki.com/bg/Ecliptic_Attrition) -- Recast 5m, increases Luopan potency by 25%, reduces Luopan lifespan, shared cooldown with Lasting_Emanation
		-- Collimated Ferver(https://www.bg-wiki.com/bg/Collimated_Fervor) -- Recast 5m, Adds 50% bonus to Cardinal Chanst cast from a particular direction
		-- Life Cycle(https://www.bg-wiki.com/bg/Life_Cycle) -- Recast 10m, Grants Luopan 25% of your current HP
		-- Blaze of Glory(https://www.bg-wiki.com/bg/Blaze_of_Glory) -- Recast 10m, Luopan potency increased by 50%
		-- Dematerialize(https://www.bg-wiki.com/bg/Dematerialize) -- Recast 10m, prevents luopan from taking damage
		-- Entrust(https://www.bg-wiki.com/bg/Entrust) -- Recast 10m, allows next Indi-spell to be cast on a party member
		-- Mending Halation(https://www.bg-wiki.com/bg/Mending_Halation) -- Recast 5m, sacrifice luopon to heal nearby party members [Did not take this merit ability]
		-- Radial Arcana(https://www.bg-wiki.com/bg/Radial_Arcana) -- Recast 5m, sacrifice luopon to restore MP of nearby party members [Took this merit ability]
		-- Theurgic Focus(https://www.bg-wiki.com/bg/Theurgic_Focus) -- Recast 5m, increases power of next -RA spell, casting range and AoE are reduced by 50%
		-- Concentric Pulse(https://www.bg-wiki.com/bg/Concentric_Pulse) -- Recast 5m, sacrifice luopon to deal AoE damage to enemies(10 yalms)
		-- Widen Compass(https://www.bg-wiki.com/bg/Widened_Compass) -- Recast 1h, Increases AoE of Geomancy spells
--
--
--
--
--
--

function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind !pause gs c cycleindi IndiSpell') -- Changes the IndiSpell that is automatically used
	send_command('bind ~pause gs c cyclegeo GeoSpell') -- Changes the GeoSpell that is automatically used
	send_command('bind @!pause gs c cycleentrust EntrustSpell') -- Changes the EntrustSpell that is automatically used
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	--autows = 'Realmrazer'
	--autofood = 'Miso Ramen'
	--autoindi = 'Haste'
	--autoentrust = 'Fury'
	autoentrustee = '<p1>'
	--autogeo = 'Frailty'
	last_indi = nil
	last_geo = nil
	blazelocked = false

	indi_duration = 250
	
	select_default_macro_book()
end

function init_gear_sets()
	
	-- example_full.sets.cast.abil = {main="",sub="",range="",ammo="",
	--	head="",neck="",ear1="",ear2="",
	--	body="",hands="",ring1="",ring2="",
	--	back="",waist="",legs="",feet=""} 
	-- 

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}  -- Bagua Tunic
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines"} -- Azimuth Hood, Bagua Mitaines
	sets.precast.JA['Lasting Emanation'] = {} -- No gear
	sets.precast.JA['Ecliptic Attrition'] = {} -- No gear
	sets.precast.JA['Collimated Ferver'] = {} -- No gear
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic"} -- Geomancy Tunic, Nantosuelta's cape
	sets.precast.JA['Blaze of Glory'] = {} -- No gear
	sets.precast.JA.Dematerialize = {} -- No gear
	sets.precast.Entrust = {} -- No gear
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"} -- Bagua pants
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"} -- Bagua pants
	sets.precast.JA['Theurgic Focus'] = {} -- No gear
	sets.precast.JA['Concentric Pulse'] = {} -- Bagua Galero +2
	sets.precast.JA['Widen Compass'] = {} -- No gear
	
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants", feet="Azimuth Gaiters",back="Lifestream Cape"} -- TODO:  Nantosuelta, Solstice, Gada(AUG)
	
	-- Fast cast sets for spells

	-- Total FC:  58-60, cap is 80
	sets.precast.FC = {main="Oranyan",sub="",range="",ammo="Sapience Orb",
		head="Nahtirah hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquacious earring",
		body="Vrikodara jupon",hands="",ring1="Prolix ring",ring2="",
		back="Lifestream cape",waist="Witful belt",legs="Geomancy pants",feet="Regal Pumps +1"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})

	-- FC + 11	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua mitaines"})

    -- FC + 5(-3 from lost of Witful, +8 from Siegel)
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Recieved = {}
	sets.Self_Refresh = {}
	sets.Refresh_Recieved = {}

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {ear1="Earthcry Earring"})

	sets.precast.FC.Impact = {}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Gear Haste Cap:  25, FC Set: 21, FastRecast set: +2
	-- Currently at 23
    sets.midcast.FastRecast = {legs="Assid. Pants +1",feet="Battlecast Gaiters"}

    -- Skill pieces
	sets.midcast.Geomancy = {
		head="Azimuth Hood +1",
		body="Bagua Tunic +1",hands="Geo. Mitaines +1",ring1="Stikini Ring",ring2="Stikini",
		back="Lifestream cape"} -- TODO:  Reti Pendant/Incanter's Torque, Solstice


	--Extra Indi duration on any slot you can't get skill on here.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants",feet="Azimuth Gaiters"})
	
	-- Cure cap 50%
	-- Currently at 55%
    sets.midcast.Cure = {main="Serenity", neck="Imbodia necklace",
    					body="Vrikodara jupon",hands="Telchine Gloves",ring1="Globidonta Ring",ring2="Stikini ring",
    					back="Solemnity Cape"}
		
    sets.midcast.LightWeatherCure = {}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
	-- TODO:  Create variable for Helios boots with +atk +acc
    sets.midcast['Elemental Magic'] = {main="Serenity",sub="Elementa Grip",range="",ammo="Witchstone",
    									head="Geomancy Galero",neck="Eddy necklace",ear1="Strophadic Earring",ear2="Friomisi earring",
    									body="Helios Jacket",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
    									back="Toro Cape",waist="Aswang Sash",legs="Hagondes Pants",feet=helios_nuke_feet}

	-- TODO:  Create variable for Helios jacket with +30acc and +20 atk
    sets.midcast['Elemental Magic'].Resistant = {body=gear.helios_nuke_body,ear2="Gwati earring",back="Izdubar Mantle"}
		
    sets.midcast['Elemental Magic'].Fodder = {neck="Saevus Pendant +1",body="Witching robe"}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
    sets.midcast['Dark Magic'] = {body="Geomancy tunic"}
		
    sets.midcast.Drain = {head="Bagua Galero",waist="Fucho-no-obi"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {}
		
	sets.midcast.Stun.Resistant = {}

		
	sets.midcast.Impact = {}
		
	sets.midcast['Enfeebling Magic'] = {main="Oranyan",sub="Elder's Grip",ammo="",
										head=gear.helios_nuke_head,neck="Imbodia Necklace",ear1="Gwati Earring",ear2="Strophadic Earring",
										body=gear.helios_nuke_body,hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
										back="Lifestream cape",waist="Aswang sash",legs="Psycloth Lappas",feet="Medium's sabots"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {main="Oranyan",
										body="Telchine chas.",ring1="Stikini ring",ring2="Stikini ring",
										waist="Cascade Belt",feet="Regal Pumps +1"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {}

	-- Idle sets

	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",
		neck="Twilight Torque",ear1="Etiolation Earring",
		body="Vrikodara Jupon",hands="Bagua Mitaines",ring1="Defending Ring",ring2="Dark Ring",
		back="Lifestream Cape",waist="Flax Sash",legs="Assid. Pants +1"}
		
	sets.idle.PDT = {}
		
	sets.idle.TPEat = set_combine(sets.idle, {})
	sets.idle.Regain = set_combine(sets.idle, {})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {}

	
	sets.idle.PDT.Pet = {}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {}

	-- Defense sets
	
	sets.defense.PDT = {}

	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {}
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {hands="Amalric gages",ring2="Locus ring"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end
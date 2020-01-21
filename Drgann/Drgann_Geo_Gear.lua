function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	--state.ResistDefenseMode:options('MEVA')

	--gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	--gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	--gear.obi_high_nuke_waist = "Refoccilation Stone"

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 250
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Recieved = {}
	sets.Self_Refresh = {}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {}

	sets.midcast.Geomancy = {}


	--Extra Indi duration on any slot you can't get skill on here.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {})
		
    sets.midcast.Cure = {}
		
    sets.midcast.LightWeatherCure = {}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {}

    sets.midcast['Elemental Magic'].Resistant = {}
		
    sets.midcast['Elemental Magic'].Fodder = {}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
    sets.midcast['Dark Magic'] = {}
		
    sets.midcast.Drain = {}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {}
		
	sets.midcast.Stun.Resistant = {}

		
	sets.midcast.Impact = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
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
		
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
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
    sets.MagicBurst = {}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end
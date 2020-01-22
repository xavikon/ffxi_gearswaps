function user_setup()

	-- Options: Override default values
        state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal','Resistant')
        state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')

	gear.jse_back = {name="Nantosuelta's Cape"}
	
	gear.obi_cure_back = "Tempered Cape"
	gear.obi_cure_waist = "Cascade Belt"

	autoindi = "Haste"
	autogeo = "Frailty"

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @pause gs c toggle AutoBuffMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	
	indi_duration = 240
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +2",back=gear.jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {main="Solstice",back="Nantosuelta's Cape",legs="Bagua pants",feet="Azimuth Gaiters +1"}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Solstice",head="Vanya Hood",body="Helios Jacket",
                           waist="Witful Belt",back="Lifestream cape",legs="Geo. Pants +1",feet="Regal Pumps"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})

	sets.precast.FC.Cure = set_combine(sets.precast.FC)
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Flash Nova'] = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {body="Helios Jacket",hands="Helios Gloves",back="Lifestream Cape",legs="Geo. Pants +1",feet="Regal Pumps"}

        sets.midcast.Geomancy = {range="Dunna",head="Azimuth hood +1",hands="Geo. Mitaines +2",body="Bagua tunic +1"}


	--Extra Indi duration on any slot you can't get skill on here.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {main="Solstice",sub="Genbu's Shield",
                                        legs="Bagua Pants",feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {main="Divinity",
        hands="Telchine Gloves",ring2="Sirona's Ring",
        back="Tempered Cape",legs="Geo. Pants +1",feet="Regal Pumps"}
		
    sets.midcast.LightWeatherCure = {main="Iridal Staff",sub="Curatio Grip",
        hands="Telchine Gloves",ring2="Sirona's Ring",
        legs="Geo. Pants +1",feet="Regal Pumps"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Iridal Staff",
        hands="Telchine Gloves",ring2="Sirona's Ring",
        legs="Geo. Pants +1",feet="Regal Pumps"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {ammo="Kalboron Stone",
        head="Geomancy galero",neck="Sanctity necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Azimuth coat",hands="Amalric Gages",ring1="Shiva Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Channeler's stone",legs="Merlinic Shalwar",feet="Jhakri pigaches"}

    sets.midcast['Elemental Magic'].Resistant = {ammo="Kalboron Stone",
        head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Shiva Ring",ring2="Jhakri Ring",
        back="Toro Cape",waist="Acuity Belt",legs="Jhakri Slops +1",feet="Jhakri pigaches +1"}

		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Culminus",ammo="Kalboron Stone",
        head="Bagua galero",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Barkaro. Earring",
        body="Geomancy Tunic",hands="Amalric Gages",ring1="Evanescene Ring",ring2="Metamor. Ring +1",
        back="Toro Cape",waist="Acuity Belt",legs="Merlinic Shalwar",feet="Jhakri pigaches"}
		
    sets.midcast.Drain = {head="Bagua galero +1",waist="Fucho-no-Obi",ring1="Evanescence Ring"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {}
		
	sets.midcast.Stun.Resistant = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
	sets.midcast['Enfeebling Magic'].Resistant = {}
		
	sets.midcast['Enhancing Magic'] = {hands="Telchine Gloves",
		waist="Cascade Belt",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'])
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'])
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'])
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'])
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'])
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'])

	-- Gear for specific elemental nukes.

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Iridal Staff",hands="Bagua Mitaines +1"}

	-- Idle sets

	sets.idle = {main="Solstice",sub="Genbu's Shield",
                        head="Vanya hood",body="Geomancy Tunic +2",hands="Bagua Mitaines +1",ring1="Sirona's Ring",ring2="Fortified Ring",
                        back="Solemnity Cape",legs="Assid. Pants +1", feet="Geomancy Sandals"}
		
	sets.idle.PDT = {main="Earth Staff",neck="Loricate Torque"}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Solstice",sub="Genbu's Shield",range="Dunna",head="Azimuth Hood +1",body="Geo. Tunic +2",neck="Loricate Torque",ear2="Handler's Earring",
                back="Lifestream Cape",waist="Isa belt",legs="Assid. Pants +1",hands="Geo. Mitaines +1",feet="Bagua Sandals"}

	sets.idle.PDT.Pet = {main="Earth Staff",head="Azimuth Hood +1",body="Geo. Tunic +2",neck="Loricate Torque",ear2="Handler's Earring",
		hands="Geo. Mitaines +1",feet="Bagua Sandals"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Solstice",sub="Genbu's Shield",hands="Bagua Mitaines +1"}

	-- Defense sets
	
	sets.defense.PDT = {main="Earth Staff",sub="Mensch Strap",neck="Loricate Torque",
                            hands="Geo. Mitaines +1",ear1="Merman's Earring",ear2="Merman's Earring",back="Cheviot Cape"}

	sets.defense.MDT = {main="Earth Staff",head="Azimuth Hood +1",neck="Loricate Torque",
                           ear1="Merman's Earring",ear2="Merman's Earring",ring2="Fortified Ring"}
		
    sets.defense.MEVA = {}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	--sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
        sets.MagicBurst = {main="Lehbrailg +2",sub="Elder's grip +1",ammo="Kalboron Stone",
        head="Jhakri Coronal +1",body="Helios Jacket",hands="Amalric gages",neck="Sanctity Necklace",
        ring1="Jhakri Ring",ring2="Locus Ring",ear1="Static Earring",ear2="Friomisi Earring",
        legs="Jhakri slops +1",feet="Jhakri Pigaches",back="Toro Cape",waist="Acuity belt"}
        --neck="Mizu. Kubikazari",

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end
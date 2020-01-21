-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @pause gs c toggle AutoSubMode')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
        --39
    sets.precast.FC = {
		head="Vanya Hood",neck="Orison Locket",ear1="Etiolation Earring",
		body="Inyanga Jubbah",hands="Gende. Gages +1",
		back="Swith Cape",waist="Witful Belt",feet="Regal Pumps +1"}

                
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
        --54
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Doyen pants"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
        --73
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {back="Pahtli cape",
                                        ear1="Nourish. Earring",ear2="Nourish. Earring +1",
                                        legs="Doyen Pants",feet="Hygieia Clogs +1"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.CureSolace = sets.precast.FC.Cure

    sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Piety Briault +1",hands="Telchine Gloves",
		waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Vanya Robe",hands="Telchine Gloves",ring1="Rajas Ring",ring2="Globidonta Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}

    sets.precast.WS['Flash Nova'] = {}

    sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	--sets.DayIdle = {}
	--sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Recieved = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="Helios Gloves",ring1="Prolix Ring",ring2="Dark Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
		
	sets.midcast.Teleport = {main="Terra's Staff",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Gifted Earring",
		body="Vanya Robe",hands="Fanatic Gloves",ring1="Prolix Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Austerity Belt +1",legs="Lengo Pants",feet="Hygieia Clogs +1"}

    -- Cure sets
                --Cure Cast time/FastCast(with Light Arts)(80% cap):      104[80]
                --Cure Cast time/FastCast(without Light Arts)(80% cap):   94[80]
                --Cure Potency(50% cap):                                  51[50]
                --Enmity Down(-50 cap):                                   11
                --Healing magic @500:                                     501
        
	sets.midcast.Cure = {main="Queller rod",sub="Genbu's shield",
		head="Vanya Hood",neck="Healing torque",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Inyanga Jubbah",hands="Kaykaus cuffs",ring1="Sirona's ring",ring2="Haoma's Ring",
		back="Mending cape",waist="Cascade belt",legs="Ebers Pant. +1",feet="Kaykaus Boots"}
        
        sets.midcast.Curaga = set_combine(sets.midcast.Cure, {back="Pahtli cape",ring2="Solemn ring"})
        
	sets.midcast.Cursna = {
		head="Vanya Hood",neck="Malison Medallion",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Inyanga jubbah",hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Haoma's Ring",
		back="Mending Cape",waist="Austerity Belt +1",legs="Ebers Pant. +1",feet="Regal Pumps"}

	sets.midcast.StatusRemoval = {ammo="Hasty Pinion +1",
		head="Ebers Cap +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah",hands="Inyanga Dastanas",ring1="Sirona's Ring",ring2="Stikini Ring",
		back="Swith Cape",waist="Witful Belt",legs="Ebers Pant. +1",feet="Regal Pumps +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Prolix Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Stoneskin = {ammo="Hasty Pinion +1",
		head="Telchine Cap",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Siegel Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",waist="Emphatikos Rope"})

	sets.midcast.BarElement = {main="Beneficus",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Ebers Cap +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Ebers Bliaud +1",hands="Ebers Mitts +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Piety Pantaln. +1",feet="Ebers Duckbills +1"}

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga tiara",body="Piety Briault +1",hands="Ebers Mitts +1",legs="Theo. Pant. +1"})
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})

	sets.midcast.Impact = {ammo="Pemphredo Tathlum",
		head=empty,neck="Incanter's Torque",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_gloves,ring1="Vertigo Ring",ring2="Metamor. Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet="Helios Boots"}

	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {}

	sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = {}

    sets.midcast.Drain.Resistant = {}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {}

	sets.midcast.Stun.Resistant = {}

    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Enfeebling Magic'].Resistant = {}
		
    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Globidonta Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Globidonta Ring"})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Queller rod",sub="Genbu's shield",ammo="Homiliary",
		head="Blistering Sallet",neck="Loricate Torque",ear1="Merman's earring",ear2="Merman's Earring",
		body="Piety Briault +1",hands="Gende. Gages +1",ring1="Sirona's Ring",ring2="Fortified Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Inyanga crackows"}

	--sets.idle.PDT = {main="Nehushtan",sub="Genbu's Shield",ammo="Incantor stone",
	--	head="Vanya Hood",neck="Verisa collar",ear1="Merman's earring",ear2="Merman's Earring",
	--	body="Inyanga jubbah",hands="Gende. Gages +1",ring1="Sirona's Ring",ring2="Shneddick Ring",
	--	back="Cheviot Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Inyanga crackows"}


    -- Defense sets

	sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Piety Briault +1",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Solemnity Cape",waist="Flax Sash",legs="Gende. Spats +1",feet="Gende. Galosh. +1"}

	sets.defense.MDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +1",hands=gear.chironic_refresh_gloves,ring1="Defending Ring",ring2="Fortified Ring",
		back="Solemnity Cape",waist="Flax Sash",legs="Gende. Spats +1",feet="Gende. Galosh. +1"}

    sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Telchine Cap",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +1",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Aurist's Cape +1",waist="Ovate Rope",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	

		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    --sets.engaged = sets.idle.PDT

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 6)
	elseif player.sub_job == 'RDM' then
		set_macro_page(4, 6)
	elseif player.sub_job == 'BLM' then
		set_macro_page(7, 6)
	else
		set_macro_page(3, 6)
	end
end
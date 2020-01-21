-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')

    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet"
    gear.MAbullet = "Orichalcum Bullet"
    gear.QDbullet = "Animikii Bullet"
    gear.RAAccbullet = "Adlivun Bullet"
    options.ammo_warning_limit = 15

    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` input /ja "Bolter\'s Roll" <me>')
    send_command('bind @f7 gs c toggle AutoShootMode')

    gear.herc_body_wsd = {name="Herculean Vest", augments={'Rng.Atk.+29','Weapon skill damage +1%','AGI+13','Rng.Acc.+9',}}
    gear.herc_body_melee = {name="Herculean Vest", augments={'Accuracy+22','"Triple Atk."+2','Attack+5',}}
    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +2"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}

    
    sets.precast.CorsairRoll = {head="Lanun Tricorne +1",hands="Chasseur's Gants +1",neck="Regal Necklace",ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +2"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Navarch's Gants +2"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
    sets.precast.CorsairShot = {head="Pixie Hairpin +1",hands="Leyline gloves",body="Samnuha coat",back="Gunslinger's cape",
                                waist="Eschan Stone",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Carmine Mask",body="Taeon Tabard",ear2="Loquacious Earring",hands="Thaumas Gloves",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",
        body="Laksamana's Frac",hands="Lanun Gants +1",
        back="Navarch's Mantle",waist="Impulse Belt",legs="Nahtirah Trousers",feet="Meg. Jam. +1"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Manibozho Jerkin",hands="Adhemar wristbands",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Camulus's mantle",waist="Fotia Belt",legs="Samnuha tights",feet="Meg. Jam. +1"}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = sets.precast.WS
    
    sets.precast.WS['Savage Blade'] = {head="Herculean Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body=gear.herc_body_wsd,
                                        hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Kerieyh Ring",back="Camulus's mantle",waist="Metalsinger belt",
                                        legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})
        --wsd, ratk, agi
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Herculean Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Kerieyh Ring",
        back="Camulus's mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Meg. Jam. +1"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Herculean Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Kerieyh Ring",
        back="Camulus's mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Meg. Jam. +1"}
        --WSD & MAB
    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Kerieyh Ring",
        back="Camulus's mantle",waist="Eschan Stone",legs="Herculean trousers",feet="Meg. Jam. +1"}

    --WSD & MAB
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Kerieyh Ring",
        back="Gunslinger's cape",waist="Eschan Stone",legs="Herculean Trousers",feet="Meg. Jam. +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.precast.MaxTP = {ear1="Telos Earring",ear2="Ishvara Earring"}
	sets.precast.AccMaxTP = {ear1="Telos Earring",ear2="Digni. Earring"}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask",body="Taeon tabard",hands="Leyline Gloves"}
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Recieved = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Garuda Ring",ring2="Garuda Ring",
        back="Gunslinger's cape",waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean boots"}

    sets.midcast.CorsairShot.Acc = {ammo=gear.QDbullet,
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Garuda Ring",ring2="Garuda Ring",
        back="Gunslinger's cape",waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean boots"}

    sets.midcast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Garuda Ring",ring2="Garuda Ring",
        back="Gunslinger's cape",waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean boots"}

    sets.midcast.CorsairShot['Dark Shot'] = set_combine(sets.midcast.CorsairShot['Light Shot'], {head="Pixie Hairpin +1"})


    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Ocachi Gorget",ear1="Telos Earring",ear2="Volley Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Longshot ring",
        back="Camulus's mantle",waist="Ponente Sash",legs="Herculean trousers",feet="Meg. Jam. +1"}

    sets.midcast.RA.Acc = {ammo=gear.RAAccbullet,
        head="Meghanada Visor +1",neck="Iqabi Necklace",ear1="Telos Earring",ear2="Volley Earring",
        body=gear.herc_body_wsd,hands="Meg. Gloves +2",ring1="Cacoethic Ring +1",ring2="Hajduk Ring",
        back="Camulus's mantle",waist="Eschan Stone",legs="Samnuha tights",feet="Meg. Jam. +1"}

    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Twilight Torque",ear1="Telos Earring",ear2="Neritic Earring",
        body="Meg. cuirie +1",hands="Meg. Gloves +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Solemnity Cape",waist="Flume Belt",legs="Meg. Chausses",feet="Meg. Jam. +1"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Meghanada Visor +1",neck="Twilight Torque",
        body="Meg. cuirie +1",hands="Meg. Gloves +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Solemnity Cape",waist="Flume Belt",legs="Meg. Chausses",feet="Meg. Jam. +1"}

    sets.defense.MDT = {
        neck="Twilight Torque",
        ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Engulfer Cape +1",waist="Flume Belt"}
    

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head="Carmine mask",neck="Asperity necklace",ear1="Telos Earring",ear2="Brutal Earring",
        body=gear.herc_body_melee,hands="Herculean Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Samnuha tights",feet="Taeon boots"}
       
    sets.engaged.Acc = {ammo=gear.RAbullet,
        head="Carmine Mask",neck="Iqabi necklace",ear1="Telos Earring",ear2="Digni. Earring",
        body="Meg. cuirie +1",hands="Adhemar wristbands",ring1="Cacoethic Ring +1",ring2="Ramuh Ring",
        back="Bleating Mantle",waist="Anguinus Belt",legs="Carmine Cuisses +1",feet="Meg. Jam. +1"}

    sets.engaged.Melee.DW = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. cuirie +1",hands="Herculean Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Twilight Belt",legs="Samnuha tights",feet="Taeon boots"}
    
    sets.engaged.Acc.DW = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. cuirie +1",hands="Herculean Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Anguinus Belt",legs="Meg. Chausses",feet="Meg. Jam. +1"}

    sets.engaged.Ranged = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Iqabi Necklace",ear1="Telos Earring",ear2="Volley Earring",
        body="Meg. cuirie +1",hands="Meg. Gloves +2",ring1="Cacoethic ring +1",ring2="Longshot Ring",
        back="Camulus's mantle",waist="Kwahu Kachina Belt",legs="Herculean Trousers",feet="Meg. Jam. +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 19)
end
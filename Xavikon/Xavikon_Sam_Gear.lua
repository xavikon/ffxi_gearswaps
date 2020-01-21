-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'PDTOnly', 'Reraise')
    state.WeaponskillMode:options('Normal')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
    state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')

    update_combat_form()
        gear.wsd_mask = {name="Valorous Mask", augments={'Attack+24','Weapon skill damage +5%','Accuracy+13',}}
        gear.wsd_mitts = {name="Valorous Mitts", augments={'Accuracy+24 Attack+24','Weapon skill damage +3%','VIT+5','Accuracy+11','Attack+1',}}
        gear.da_valor_legs = {name="Valor. Hose", augments={'Attack+13','"Dbl.Atk."+3','DEX+2',}}
        gear.da_mask = {name="Valorous Mask", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+1','STR+8','Attack+4',}}
	--Delete or comment out this line if you don't use Addon legs with Waltz cost-50
--	waltz_tp_cost = {['Curing Waltz'] = 150, ['Curing Waltz II'] = 300, ['Curing Waltz III'] = 450, ['Curing Waltz IV'] = 600, ['Curing Waltz V'] = 750}
	
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote",back="Smertrios's mantle"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +1"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
    sets.precast.Step = {
        head="Acro Helm",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Steelflash Earring",
        body="Acro Surcoat",hands="Acro Gauntlets",ring1="Cacoethic Ring",ring2="Cacoethic Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Acro Breeches",feet="Founder's Greaves"}
    sets.precast.JA['Violent Flourish'] = {
        head="Founder's Corona",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Found. Breastplate",hands="Leyline Gloves",ring1="Vertigo Ring",ring2="Cacoethic Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Acro Breeches",feet="Founder's Greaves"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Yaoyotl Helm",
        body="Mes. Haubergeon",hands="Acro Gauntlets",ring1="Asklepian Ring",ring2="Valseur's Ring",
        waist="Chaac Belt",legs="Acro Breeches",feet="Sak. Sune-Ate +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}
	   
    -- Ranged snapshot gear
    sets.precast.RA = {feet="Ejekamal Boots"}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=gear.valor_wsd_head,neck="Fotia Gorget",ear1="Ishvara earring",ear2="Moonshade Earring",
        body="Nzingha Cuirass",hands=gear.valor_wsd_hands,ring1="Ifrit Ring +1",ring2="Karieyh Ring",
        back="Smertrios's Mantle",waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet=gear.valor_wsd_feet}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {head="Flam. Zucchetto +2",ear1="Telos Earring",ear2="Digni. Earring",body="Wakido Domaru +2",
                                                                hands="Wakido Kote +2",ring1="Cacoethic Ring +1",ring2="Flamma Ring",feet="Wakido Sune. +2"})
    sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
    

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",neck="Asperity necklace",body=gear.valor_multi_body,waist="Windbuffet Belt +1",hands=gear.valor_multi_hands,ear1="Brutal Earring",ring1="Petrov Ring",ring2="Flamma Ring",legs=gear.valor_multi_legs,feet="Flam. Gambieras +2"})
    sets.precast.WS['Tachi: Shoha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Shoha'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Focal Orb"})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",neck="Asperity necklace",body=gear.valor_multi_body,waist="Windbuffet Belt +1",hands=gear.valor_multi_hands,ear1="Brutal Earring",ring1="Petrov Ring",ring2="Flamma Ring",legs=gear.valor_multi_legs,feet="Flam. Gambieras +2"})
    sets.precast.WS['Tachi: Rana'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Rana'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Rana'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Focal Orb"})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Kasha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Kasha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Kasha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Kasha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Gekko'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Gekko'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Gekko'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Gekko'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Yukikaze'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Yukikaze'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Ageha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Ageha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Ageha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Ageha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    --sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {ear1="Friomisi Earring",ammo="Pemphredo Tathlum",hands="Founder's gauntlets",body="Found. Breastplate"})
    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {ear1="Friomisi Earring",hands="Founder's gauntlets",body="Found. Breastplate"})
    sets.precast.WS['Tachi: Jinpu'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Jinpu'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Jinpu'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Jinpu'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Apex Arrow'] = {
        head="Gavialis Helm",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Moonshade Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Cacoethic Ring",ring2="Cacoethic Ring +1",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Acro Breeches",feet="Waki. Sune-Ate +1"}
		
    sets.precast.WS['Apex Arrow'].SomeAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].FullAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Fodder = set_combine(sets.precast.WS['Apex Arrow'], {ring1="Rajas Ring",back="Buquwik Cape"})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
	sets.precast.AccMaxTP = {ear1="Zennaroi Earring",ear2="Steelflash Earring"}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Loess Barbuta +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Tartarus Platemail",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Mollusca Mantle",waist="Tempus Fugit",legs="Hiza. Hizayoroi +1",feet="Amm Greaves"}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
		
    -- Ranged gear
    sets.midcast.RA = {
        head="Yaoyotl Helm",neck="Ocachi Gorget",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Paqichikaji Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Acro Breeches",feet="Waki. Sune-Ate +1"}

    sets.midcast.RA.Acc = {
        head="Yaoyotl Helm",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Paqichikaji Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Acro Breeches",feet="Waki. Sune-Ate +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Loricate Torque +1",ring1="Defending Ring",ring2="Sheltered Ring"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.Weapons = {main="Dojikiri Yasutsuna",sub="Utu grip"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
    sets.idle = {
        head=gear.wsd_mask,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Sanare Earring",
        body="Hizamaru Haramaki",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Karieyh Ring",
        back="Solemnity Cape",waist="Flume Belt",legs="Valor. Hose",feet="Flam. Gambieras +1"}
		
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = {
       }
		
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Loess Barbuta +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Mollusca Mantle",waist="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots +1"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {
        head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Engulfer Cape +1",waist="Flax Sash",legs="Otronif Brais +1",feet="Otronif Boots +1"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {
        head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
	body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Engulfer Cape +1",waist="Flax Sash",legs="Otronif Brais +1",feet="Otronif Boots +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    -- STP Needed with 0 gifts using Bloodrain and Ginsen:  76
    -- Current STP:  73
    sets.engaged = {
        head="Flam. Zucchetto +2",neck="Moonbeam nodowa",ear1="Dedition Earring",ear2="Brutal Earring",
        body="Wakido Domaru +2",hands="Wakido kote +2",ring1="Petrov Ring",ring2="Flamma Ring",
        back="Takaha Mantle",waist="Ioskeha Belt",legs="Kasuga Haidate +1",feet="Wakido Sune. +2"}
        -- Acc: 278
        -- STP: 72
        -- Haste:  27
        -- DA:  25
    sets.engaged.Acc = set_combine(sets.engaged, {ring1="Cacoethic Ring +1",ear1="Telos Earring",ear2="Digni. Earring"})
    
	
        
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Berserker's Torque"}
	sets.buff.Hasso = {legs="Kasuga Haidate +1"}
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {hands="Wakido kote +2",feet="Kas. Sune-Ate +1",feet="Wakido sune. +2"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 1)
    else
        set_macro_page(1, 1)
    end
end
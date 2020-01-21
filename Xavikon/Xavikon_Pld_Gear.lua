function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal', 'Acc')
        state.HybridMode:options('Tank', 'DDTank', 'Normal')
        state.WeaponskillMode:options('Normal', 'Acc')
        state.CastingMode:options('Normal', 'Resistant')
        state.PhysicalDefenseMode:options('PDT', 'PDT_HP', 'Tank')
        state.MagicalDefenseMode:options('AegisMDT','OchainMDT','MDT_HP')
	state.ResistDefenseMode:options('MEVA', 'Death','Charm')
	state.IdleMode:options('Normal', 'Tank', 'PDT', 'MDT')
    
        state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Twilight'}
        state.EquipShield = M(false, 'Equip Shield w/Defense')

        update_defense_mode()

	--Delete or comment out this line if you don't use Addon legs with Waltz cost-50
--	waltz_tp_cost = {['Curing Waltz'] = 150, ['Curing Waltz II'] = 300, ['Curing Waltz III'] = 450, ['Curing Waltz IV'] = 600, ['Curing Waltz V'] = 750}

        gear.wsd_mask = {name="Valorous Mask", augments={'Attack+24','Weapon skill damage +5%','Accuracy+13',}}
        gear.wsd_mitts = {name="Valorous Mitts", augments={'Accuracy+24 Attack+24','Weapon skill damage +3%','VIT+5','Accuracy+11','Attack+1',}}
        gear.da_valor_legs = {name="Valor. Hose", augments={'Attack+13','"Dbl.Atk."+3','DEX+2',}}
        gear.da_mask = {name="Valorous Mask", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+1','STR+8','Attack+4',}}


	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
        send_command('bind !f11 gs c cycle ExtraDefenseMode')
        send_command('bind @f10 gs c toggle EquipShield')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	
        select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {head="Souv. Schaller +1",neck="Invidia Torque",body="Rev. Surcoat +2",hands="Macabre Gaunt. +1",ear1="Friomisi Earring",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back="Rudianos's Mantle",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Cab. Leggings +1"}
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Rev. Surcoat +2"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Rev. Coronet +1",body="Cab. Surcoat +1"})
	

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
        sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})

        
    -- Don't need any special gear for Healing Waltz.

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",ring1="Kishar Ring"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
		head=gear.wsd_mask,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Lustratio Harness",hands=gear.wsd_mitts,ring1="Petrov Ring",ring2="Karieyh ring",
		back="Laic Mantle",waist="Fotia Belt",legs="Flamma Dirs +1",feet="Sulev. Leggings +1"}

    sets.precast.WS.Acc = {ammo="Ginsen",
        head="Ryuo somen",neck="Fotia Gorget",ear1="Telos Earring",ear2="Digni. Earring",
        body="Nzingha Cuirass",hands=gear.wsd_mitts,back="Rudianos's Mantle",waist="Fotia Belt",legs="Valor. Hose",feet="Sulevia's Leggings +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    --sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Heartseeker Earring",ear2="Moonshade Earring"})
	
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Jukukik Feather",head="Valorous mask",hands="Flam. Manopolas +1",legs="Lustratio subligar",feet="Lustratio leggings",
                                                        ring2="Ramuh Ring"})
        --sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Heartseeker Earring",ear2="Moonshade Earring"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
        --sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Heartseeker Earring",waist="Metalsinger Belt",ear2="Moonshade Earring",back="Laic Mantle"})
	
        sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
        head="Sulevia's Mask +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Acumen Ring",ring2="Archon Ring",
        back="Toro Cape",waist="Fotia Belt",legs="Reverence Breeches +1",feet="Founder's Greaves"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']
	
    sets.precast.WS['Atonement'] = {ammo="Paeapua",
		head="Rev. Coronet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Suppanomimi",
		body="Phorcys Korazin",hands="Macabre Gaunt. +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Fierabras's Mantle",waist="Fotia Belt",legs="Cab. Breeches +1",feet="Sulevia's Leggings +1"}
		
    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
	sets.precast.AccMaxTP = {ear1="Heartseeker Earring",ear2="Steelflash Earring"}
    
    
	--------------------------------------
	-- Midcast sets
	--------------------------------------

        sets.midcast.FastRecast = {}
        
        sets.midcast.Flash = set_combine(sets.Enmity, {})
        sets.midcast.Stun = set_combine(sets.Enmity, {})
                --Spell interruption
                --Merits   +10%                 DONE
                --ammo     +10%                 DONE
                --belt      +5%                 DONE
                --earring   +8%                 MAGNETIC
                --earring   +5%                 DONE
                --Souv Hat +15%                 DONE
                --Odyssean feet +20%            NEED
                --Founder's Legs +30%           DONE
                        -- From DT set, Native DT is 55%
                                --Belt -3%
                                --Head -5%
                                --Legs -6%
                                --Feet -3%
                        -- 103% SIRD, -5%MDT -2%PDT
        sets.precast['Blue Magic'] = set_combine(sets.Enmity, {ammo="Impatiens",head="Souveran Schaller",neck="Willpower torque",
                                                                ear1="Halasz Earring",ear2="Magnetic earring",legs="Founder's Hose",
                                                                waist="Resolute Belt",feet="Odyssean Greaves"})         
         
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {ammo="Impatiens",head="Souveran Schaller",neck="Willpower torque",
                                                                ear1="Halasz Earring",ear2="Magnetic earring",legs="Founder's Hose",
                                                                waist="Resolute Belt",feet="Odyssean Greaves"})

        sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
		
	sets.Cure_Recieved = {head="Souv. Schaller +1",legs="Souv. Diechlings +1"}

        sets.midcast['Enhancing Magic'] = {}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {back="Weard Mantle"})
    
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
    
    -- Idle sets
        sets.idle = {ammo="Staunch Tathlum", --52%PDT, 52%MDT, 
		head="Souv. Schaller +1",neck="Creed collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Rev. Surcoat +2",hands="Souv. Handsch. +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Rev. Leggings +2"}
                
		
        sets.idle.PDT = {ammo="Staunch Tathlum", --52%PDT, 52%MDT, 
		head="Souv. Schaller +1",neck="Creed collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Rev. Surcoat +2",hands="Souv. Handsch. +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Rev. Leggings +2"}
		
        sets.idle.MDT = {sets.idle.PDT}

	sets.idle.Tank = {ammo="Staunch Tathlum", --52%PDT, 52%MDT, 
		head="Souv. Schaller +1",neck="Creed collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Rev. Surcoat +2",hands="Souv. Handsch. +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Rev. Leggings +2"}
		
	sets.idle.KiteTank = set_combine(sets.idle.PDT, {})
		
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {back="Rudianos's Mantle",waist="Flume Belt"}
    sets.MP_Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"}
    sets.MagicalShield = {sub="Aegis"}
	
        
        sets.defense.PDT = {ammo="Staunch Tathlum", --52%PDT, 52%MDT, 
		head="Souv. Schaller +1",neck="Creed collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Rev. Surcoat +2",hands="Souv. Handsch. +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Rev. Leggings +2"}
                
        sets.defense.PDT_HP = set_combine(sets.defense.PDT, {ammo="Angha gem",hands="Rev. Gauntlets +2", legs="Rev. Breeches +2", feet="Rev. Leggings +2"})

	sets.defense.BDT = set_combine(sets.defense.PDT, {})
		
	sets.defense.Tank = set_combine(sets.defense.PDT, {})
		
	sets.defense.MEVA = set_combine(sets.defense.PDT, {})
		
	sets.defense.Death = {ammo="Staunch Tathlum",
        head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Creed Earring",ear2="Ethereal Earring",
	body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Warden's Ring",Ring2="Moonbeam Ring",
        waist="Creed Baudrier",back="Weard Mantle",legs="Cab. Cuisses +1",feet="Sulev. Leggings +1"}
		
        -- Charm Set
           --Ammo:  Staunch Tathlum             10%
           --Shield:  Adamas                    20%
           --Head:  Flawless Ribbon             10%
           --Ear1:  Hearty Earring               5%
           --Ear2:  Volunteer's Earring          5%
           --Neck:  Unmoving Collar +1           9% 
           --Ring1: Unyielding Ring              5%
           --Ring2: Wuji Ring                    5%(have)
           --Back:  Solemnity Cape              15%
           --Gloves:  Toad mittens               5%
           --Legs:  Souveran Diechlings         20%
           --Total:                             104%
	sets.defense.Charm = {ammo="Staunch Tathlum",
        head="Flawless Ribbon",ear1="Hearty Earring",ear2="Volunteer's Earring",neck="Unmoving Collar +1",
	hands="Toad mittens",ring1="Unyielding Ring",Ring2="Wuji Ring",back="Solemnity Cape",
        legs="Souv. Diechlings +1"}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = set_combine(sets.defense.PDT, {legs="Sulevi. Cuisses +1"})
		
    sets.defense.AegisMDT = set_combine(sets.defense.PDT, {legs="Sulevi. Cuisses +1"})

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
        sets.engaged = {ammo="Ginsen",head="Flamma zucchetto +1",body="Flamma korazin +1",hands="Flam. Manopolas +1",legs="Flamma dirs +1",
            feet="Flam. Gambieras +1",neck="Asperity Necklace",waist="Windbuffet Belt +1",left_ear="Steelflash Earring",right_ear="Bladeborn Earring",
            left_ring="Petrov Ring",right_ring="Rajas Ring",back="Bleating Mantle"}

    sets.engaged.Acc = {ammo="Ginsen",
        head="Flamma zucchetto +1",neck="Iqabi Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Flamma korazin +1",hands="Flam. Manopolas +1",ring1="Cacoethic Ring",ring2="Cacoethic Ring +1",
        back="Rudianos's mantle",waist="Anguinus Belt",legs="Flamma Dirs +1",feet="Flam. Gambieras +1"}

        --Borrowed gear
        --55%DT Native w/ Brilliance--
	sets.engaged.Tank = {ammo="Ginsen", 
		head="Loess Barbuta +1",neck="Creed Collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Rev. Breeches +2",feet="Rev. Leggings +2"}
	
        
        --sets.engaged.Tank = {ammo="Ginsen", --51%DT Native w/ Brilliance--
	--	head="Loess Barbuta +1",neck="Creed Collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
	--	body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",Ring2="Moonbeam Ring",
	--	back="Moonbeam Cape",waist="Flume Belt",legs="Rev. Breeches +2",feet="Rev. Leggings +2"}
		
	sets.engaged.BreathTank = {}
		
	sets.engaged.Acc.BreathTank = {}
		
	sets.engaged.DDTank = {ammo="Ginsen",
		head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Rudianos's Mantle",waist="Windbuffet Belt +1",legs="Sulevi. Cuisses +1",feet="Sulev. Leggings +1"}
		
	sets.engaged.Acc.DDTank = {ammo="Ginsen",
		head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",Ring2="Moonbeam Ring",
		back="Rudianos's Mantle",waist="Anguinus Belt",legs="Sulevi. Cuisses +1",feet="Sulev. Leggings +1"}
		
	sets.engaged.NoShellTank = {ammo="Ginsen",
        head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Thureous Earring",ear2="Etiolation Earring",
        body="Rev. Surcoat +2",hands="Rev. Gauntlets +1",ring1="Defending Ring",Ring2="Moonbeam Ring",
        back="Rudianos's Mantle",waist="Flume Belt",legs="Reverence Breeches +1",feet="Cab. Leggings +1"}
		
    sets.engaged.Acc.Tank = {ammo="Ginsen",
        head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Rev. Surcoat +2",hands="Sulev. Gauntlets +2",ring1="Defending Ring",Ring2="Moonbeam Ring",
        back="Rudianos's Mantle",waist="Anguinus Belt",legs="Sulevi. Cuisses +1",feet="Sulev. Leggings +1"}

    	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {ring1="Purity Ring",ring2="Saida Ring"})
	sets.buff.Sleep = {neck="Berserker's Torque"}
        sets.buff.Cover = {body="Rev. Surcoat +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'RUN' then
        set_macro_page(9, 8)
    elseif player.sub_job == 'RDM' then
        set_macro_page(6, 8)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 8)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 8)
    else
        set_macro_page(1, 8) --War/Etc
    end
end
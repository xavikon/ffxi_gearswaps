function user_setup()
	-- Options: Override default values
        state.OffenseMode:options('Normal','FullAcc')
	state.HybridMode:options('Normal','PDT','MDT')
        state.WeaponskillMode:options('Normal','FullAcc')
        state.CastingMode:options('Normal', 'Resistant')
        state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	
        state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'MP','SuppaBrutal', 'DWEarrings','DWMax'}
	
	gear.melee_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+6','Crit.hit rate+10',}}
	gear.mab_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.melee_herc_body = {name="Herculean Vest", augments={'Accuracy+22','"Triple Atk."+2','Attack+5',}}
        
        
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_nuke_back = "Cornflower Cape"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"
	
	--Delete or comment out this line if you don't use Addon legs with Waltz cost-50
	--waltz_tp_cost = {['Curing Waltz'] = 150, ['Curing Waltz II'] = 300, ['Curing Waltz III'] = 450, ['Curing Waltz IV'] = 600, ['Curing Waltz V'] = 750}
	
        -- BINDS:  ^ == CTRL: ! == ALT: @ == WinKey: # == AppsKey: ~ == SHIFT: % == Works only when text bar not up
	-- Additional local binds
	--send_command('bind ^` input /ja "Chain Affinity" <me>')
	--send_command('bind !` input /ja "Efflux" <me>')
	--send_command('bind @` input /ja "Burst Affinity" <me>')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Diffusion" <me>')
        --send_command('bind !f11 gs c cycle ExtraMeleeMode')
	--send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	--send_command('bind !r gs c weapons MagicWeapons;gs c update')
	--send_command('bind !q gs c weapons HybridWeapons;gs c update')

	update_combat_form()
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	--sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +1"}
	--sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +1"}
	--sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	--sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	--sets.buff.Enchainment = {} --body="Luhlaza Jubbah +1" (Don't have Enchainment, have Jubbah)
	--sets.buff.Efflux = {back=gear.melee_jse_back,legs="Hashishin Tayt +1"}
	--sets.buff.Doom = set_combine(sets.buff.Doom, {})

	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	--sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	--sets.precast.Waltz['Healing Waltz'] = {legs="Desultor Tassets"} --
	
	--sets.precast.Step = {ammo="Falcon Eye",
	--				head="Dampening Tam",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
	--				body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Cacoethic Ring",ring2="Cacoethic Ring +1",
	--				back=gear.melee_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
				
	--sets.precast.Flourish1 = {ammo="Falcon Eye",
	--		       head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Gwati Earring",
    --               body="Jhakri Robe +1 +1",hands="Jhakri Cuffs +1",ring1="Sangoma Ring",ring2="Vertigo Ring",
	--		       back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	-- Fast cast sets for spells

	sets.precast.FC = {head="Carmine Mask",ear2="Loquacious Earring",body="Herculean Vest",back="Swith Cape",legs="Gyve Trousers",feet="Helios Boots"}
		
	sets.precast.FC.Utsusemi = set_combine()
		
	sets.precast.FC['Blue Magic'] = set_combine()

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
                  body=gear.melee_herc_body,hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
				  back=gear.melee_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Taeon Boots"}

	sets.precast.WS.FullAcc = {ammo="Ginsen",head="Carmine mask",neck="Iqabi necklace",ear1="Heartseeker earring",ear2="Steelflash Earring",
				  body="Jhakri Robe +1",hands="Adhemar Wristbands",back=gear.melee_jse_back,waist="Anguinus belt",legs="Jhakri slops +1",feet="Jhakri pigaches +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +1",ear1="Moonshade Earring",ear2="Brutal Earring",
                                        hands="Jhakri Cuffs+1",ring2="Sirona's ring",legs="Jhakri Slops +1"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine()
	
	--sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ring1="Rufescent Ring",legs="Carmine Cuisses +1"})
	--sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ring1="Rufescent Ring",legs="Carmine Cuisses +1"})
	
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen",head="Adhemar Bonnet",
                                            body=gear.melee_herc_body,ear1="Moonshade Earring",ear2="Brutal Earring",ring1="Ramuh Ring",back="Rosemerta's Cape"})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine()
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +1",ear1="Moonshade Earring",hands="Jhakri Cuffs +1",ring1="Aife's Ring",ring2="Petrov Ring",legs="Jhakri Slops +1",back="Laic mantle"})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine()
	
	sets.precast.WS['Sanguine Blade'] = {head="Jhakri coronal +1",neck="Quanpur Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
                                 body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Acumen Ring",ring2="Shiva Ring",
			         back="Cornflower Cape",waist="Latria Sash",legs="Jhakri slops +1",feet="Jhakri Pigaches +1"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	--sets.precast.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	--sets.precast.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask",ear2="Loquacious Earring",
		body="Taeon tabard",back="Swith Cape",feet="Helios Boots"}
		
	sets.midcast['Blue Magic'] = {}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = {}

	sets.midcast['Blue Magic'].Physical.Resistant = {}
		
	sets.midcast['Blue Magic'].PhysicalAcc = {}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
		
	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	
	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})


	-- Magical Spells --
	
	sets.midcast['Blue Magic'].Magical = {}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine()
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})
	
	sets.midcast['Blue Magic'].MagicAccuracy = {}

	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Dark Magic'] = {}
					
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Refresh = set_combine()
	
	sets.midcast.Aquaveil = set_combine()

	sets.midcast['Divine Magic'] = {}
					
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}
					 
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	
	sets.DarkNuke = {head="Pixie Hairpin +1"}
	sets.LightNuke = {}
					 
	sets.midcast.Cure = {}
					
	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --
	
	sets.midcast['Blue Magic'].Stun = {}
				   
	sets.midcast['Blue Magic'].Stun.Resistant = {}


	-- Other Specific Spells --
	
	sets.midcast['Blue Magic']['White Wind'] = {}

	sets.midcast['Blue Magic'].Healing = {}
					
	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {}

	sets.midcast['Blue Magic'].SkillBasedBuff = {}

	sets.midcast['Blue Magic'].Buff = {}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine()
	
	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine()

	-- Sets to return to when not performing an action.

	
	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Magus Bazubands"}

	-- Resting sets

	-- Idle sets
	sets.idle = {neck="Twilight Torque",ear2="Ethereal Earring",
			      ring1="Defending Ring",ring2="Karieyh Ring"}

	sets.idle.PDT = {main="Nehushtan",sub="Genbu's Shield",neck="Twilight Torque",ear2="Ethereal Earring",ring1="Defending Ring",ring2="Moonbeam Ring",
				back="Solemnity Cape"}
				  
	-- Defense sets
	sets.defense.PDT = {main="Terra's Staff",neck="Twilight Torque",ring1="Defending Ring",ring2="Moonbeam Ring",
				back="Solemnity Cape"}

	sets.defense.MDT = {neck="Twilight Torque",head="Telchine Cap",ear2="Ethereal Earring",ring1="Defending Ring",ring2="Moonbeam Ring"}
				
        sets.defense.MEVA = {head="Telchine Cap",neck="Twilight Torque",ear2="Ethereal Earring",
                                body="Taeon tabard",hands="Adhemar Wristbands",legs="Telchine Braconi",feet="Telchine Pigaches"}
				
	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical
	
        -- Extra Melee sets.  Apply these on top of melee sets.
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Caps with Magic Haste Cap, +5DW = Change Earrings, 10DW
	
	sets.engaged = {ammo="Ginsen",
			    head="Adhemar Bonnet",neck="Lissome necklace",ear1="Telos Earring",ear2="Brutal Earring",
			    body=gear.melee_herc_body,hands="Herculean Gloves",ring1="Epona's Ring",ring2="Petrov Ring",
			    back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Taeon Boots"}

	sets.engaged.FullAcc = {ammo="Falcon Eye",
				head="Carmine Mask",neck="Iqabi necklace",ear1="Telos Earring",ear2="Digni. Earring",
				body=gear.melee_herc_body,hands="Herculean Gloves",ring1="Cacoethic Ring +1",ring2="Petrov Ring",
				back="Rosmerta's Cape",waist="Anguinus belt",legs="Samnuha Tights",feet="Jhakri Pigaches +1"}

	sets.engaged.PDT = {ammo="Ginsen",
				head="Jhakri coronal +1",neck="Twilight Torque",ear1="Suppanomimi",ear2="Brutal Earring",
                                ring1="Defending Ring",ring2="Petrov Ring",
				back="Solemnity Cape",waist="Flume Belt",legs="Samnuha Tights",feet="Taeon Boots"}

	sets.engaged.FullAcc.PDT = {ammo="Falcon Eye",
				head="Jhakri coronal +1",neck="Twilight Torque",ear1="Zennaroi Earring",ear2="Suppanomimi",
                                body=gear.melee_herc_body,hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Petrov Ring",
				back=gear.melee_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
				
	sets.engaged.MDT = {head="Jhakri coronal +1",neck="Twilight Torque",
                                hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Moonbeam Ring",
				waist="Windbuffet Belt +1"}
				
	sets.engaged.FullAcc.MDT = {ammo="Falcon Eye",
				head="Jhakri coronal +1",neck="Twilight Torque",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Moonbeam Ring",
				back=gear.melee_jse_back}
				
	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}
        sets.Kiting = {legs="Carmine Cuisses +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(7, 3)
	elseif player.sub_job == 'WAR' then
		set_macro_page(5, 3)
	elseif player.sub_job == 'RUN' then
		set_macro_page(9, 3)
	elseif player.sub_job == 'THF' then
		set_macro_page(10, 3)
	else
		set_macro_page(6, 3)
	end
end

--Dynamis Trust Overwrite
function checktrust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[936] == 0 and not havetrust("Karaha-Baruha") then
					windower.send_command('input /ma "Karaha-Baruha" <me>')
					tickdelay = 1100
					return true
				elseif spell_recasts[952] == 0 and not havetrust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = 1100
					return true
				elseif spell_recasts[914] == 0 and not havetrust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = 1100
					return true
				elseif spell_recasts[989] == 0 and not havetrust("KingOfHearts") then
					windower.send_command('input /ma "King of Hearts" <me>')
					tickdelay = 1100
					return true
				elseif spell_recasts[968] == 0 and not havetrust("Adelheid") then
					windower.send_command('input /ma "Adelheid" <me>')
					tickdelay = 1100
					return true
				else
					return false
				end
			end
		end
	end
	return false
end
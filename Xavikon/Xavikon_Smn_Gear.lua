-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.perp_staff = {name="Gridarvor"}
    gear.staff_skill = {name="Espiritus",augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%'}}
    gear.staff_magic = {name="Espiritus",augments={'Enmity-6','Pet: "Mag. Atk. Bns."+30','Pet: Damage Taken -4%'}}
    gear.aby_feet_mgk = {name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7'}}
    gear.aby_feet_skl = {name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7'}}
    gear.aby_head_mgk = {name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}}
    gear.aby_head_phy = {name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
    gear.jse_mgk = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+4'}}
    gear.jse_phy = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+8 Pet: Rng. Acc.+8','Pet: Haste+10'}}
    gear.merl_hands_mgk = {name="Merlinic Dastanas", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+5',}}
    gear.merl_hands_phy = {name="Merlinic Dastanas", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Blood Pact Dmg.+5','Pet: STR+14','Pet: Mag. Acc.+10','Pet: "Mag.Atk.Bns."+15',}}
	
    send_command('bind ^` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @pause gs c toggle AutoSubMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
        send_command('bind !` gs c toggle PactSpamMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {}
    
    sets.precast.JA['Elemental Siphon'] = {main=gear.staff_skill,sub="Vox Grip",
        head="Convoker's Horn +2",neck="Caller's Pendant",
        body="Apogee dalmatica",hands="Lamassu Mitts",ring1="Evoker's Ring",ring2="Fervor Ring",
        back="Conveyance Cape",waist="Lucidity Sash",legs="Beck. Spats +1",feet=gear.aby_feet_skl}

    sets.precast.JA['Mana Cede'] = {}

    --Current BP delay reduction
    -- BP Delay I(15cap): 20
    -- BP Delay II(15 cap): 5
    -- BP Delay III(10 cap)[these are job points only]:
    -- Favor Cap(Skill tiers, 575+3 = 8s):   
    -- Need beckoner's head and legs
    -- Pact delay reduction gear
    -- BP Delay I(15cap): 2+8+6
    -- BP Delay II(15 cap):  10
    -- BP Delay III(10 cap)[these are job points only]: 5
    -- Favor Cap(Skill tiers, 575+3 = 8s):   
    
    sets.precast.BloodPactWard = {main=gear.staff_skill,sub="Vox gip",ammo="Sancus Sachet +1",head="Con. Horn +2",neck="Caller's Pendant",
        body="Con. doublet +2",hands="Glyphic bracers +1",ring1="Evoker's Ring",ring2="Fervor Ring",ear2="Evans earring",
        back="Conveyance cape",waist="Lucidity sash",legs="Beck. Spats +1",feet=gear.aby_feet_skl}
        --ring2="Globidonta Ring"
        
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {main="Marin Staff +1",head="Telchine Cap",ear2="Loquacious Earring",back="Swith Cape",feet="Regal Pumps",waist="Channeler's Stone"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main="Marin Staff +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Helios Jacket",hands="Helios Gloves",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.midcast.Cure = {main="Serenity",sub="Curatio Grip",
        head="Nahtirah Hat",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Haoma's Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1",waist="Sekhmet Corset",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Recieved = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring", back="Tempered Cape +1",waist="Witful Belt",feet="Gende. Galosh. +1"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Marin Staff +1",sub="Clemency Grip"})

    sets.midcast.Stoneskin = {waist="Siegel Sash"}

	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}

    sets.midcast['Divine Magic'] = {}
		
    sets.midcast['Dark Magic'] = {}
		
    sets.midcast.Stun = {}
		
    sets.midcast.Stun.Resistant = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})


    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {main=gear.staff_skill,sub="Vox grip",
        head="Con. Horn +2",neck="Caller's Pendant",waist="Lucidity sash",
        body="Conv. Doublet +2",hands="Glyphic Bracers +1",ring1="Evoker's Ring",ring2="Fervor Ring",
        back="Campestres's cape",legs="Beck. Spats +1",feet=gear.aby_feet_skl}

    sets.midcast.Pet.DebuffBloodPactWard = {main=gear.staff_skill,sub="Elan strap",
        head="Beckoner's Horn +1",neck="Incanter's Torque",waist="Lucidity sash",
        body="Apogee dalmatica",hands="Glyphic Bracers +1",ring1="Evoker's Ring",ring2="Fervor Ring",
        back="Campestres's cape",legs="Apogee slacks",feet=gear.aby_feet_skl}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan strap",
        head=gear.aby_head_phy,neck="Empath Necklace",waist="Incarnation Sash",ear1="Gelos Earring",
        body="Con. Doublet +2",hands=gear.merl_hands_phy,ring1="Varar Ring",ring2="Varar Ring",
        back=gear.jse_phy,legs="Apogee slacks",feet="Convo. Pigaches +2"}
        
    sets.midcast.Pet.PhysicalBloodPactRage['Flaming Crush'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {waist="Regal belt"})

    sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

    sets.midcast.Pet.MagicalBloodPactRage = {main=gear.staff_magic,sub="Elan strap",
        head=gear.aby_head_mgk,neck="Adad Amulet",ear1="Gelos Earring",
        body="Con. Doublet +2",hands=gear.merl_hands_mgk,ring1="Varar ring",ring2="Varar ring",
        back=gear.jse_mgk,waist="Regal belt",legs="Enticer's pants",feet=gear.aby_feet_mgk}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage

	sets.midcast.Pet.PhysicalBloodPactRage.Carbuncle = {hands="Asteria Mitts +1"}
	sets.midcast.Pet.MagicalBloodPactRage.Carbuncle = {hands="Asteria Mitts +1"}
	sets.midcast.Pet.DebuffBloodPactWard.Carbuncle = {hands="Asteria Mitts +1"}
        
	
	sets.midcast.Pet.PhysicalBloodPactRage['Cait Sith'] = {hands="Lamassu Mitts +1"}
	sets.midcast.Pet.MagicalBloodPactRage['Cait Sith'] = {hands="Lamassu Mitts +1"}
	sets.midcast.Pet.DebuffBloodPactWard['Cait Sith'] = {hands="Lamassu Mitts +1"}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {main="Gridarvor",sub="Elan Strap",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Solemnity Cape",waist="Shinjutsu-no-Obi",legs="Assid. Pants +1",feet="Convo. Pigaches +2"}

    sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus Sachet +1",
        head="Hagondes Hat +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1"}

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic Horn: -4
    -- Con. Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convo. Pigaches +2: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    --551 idle skill
    --568 precast skill
    --recast 21 @ max favor?
    sets.idle.Avatar = {main=gear.staff_skill,sub="Vox grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Gelos earring",ear2="Evans Earring",
        body="Apogee dalmatica",hands="Lamassu Mitts",ring1="Evoker's ring",ring2="Fervor ring",
        back="Campestres's cape",waist="Lucidity Sash",legs="Beck. Spats +1",feet=gear.aby_feet_skl}

    sets.idle.Spirit = {main="Gridarvor",sub="Vox grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Gelos Earring",ear2="Evans Earring",
        body="Apogee dalmatica",hands="Glyphic Bracers +1",ring1="Evoker's Ring",ring2="Defending Ring",
        back="Campestres's cape",waist="Incarnation Sash",legs="Beck. Spats +1",feet=gear.aby_feet_skl}
        --Fucho-no-Obi belt

    -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Melee = {hands="Regimen Mittens",back="Campestres's cape",ear1="Domes. Earring",ear2="Handler's Earring +1"}
	
	sets.idle.Avatar.Melee.Carbuncle = {}
	sets.idle.Avatar.Melee['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {hands="Caller's Bracers +2"}
    sets.perp.Weather = {neck="Caller's Pendant",hands="Caller's Bracers +2"}
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh (Tossed mitts for room)

	sets.perp.Carbuncle = {} --hands="Carbuncle Mitts"
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    sets.perp.staff_and_grip = {main=gear.perp_staff,sub="Oneiros Grip"}
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}

    sets.defense.MEVA = {}
		
    sets.Kiting = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(4, 17)
end

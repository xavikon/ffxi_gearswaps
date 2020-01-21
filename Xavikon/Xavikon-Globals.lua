--Place you can overwrite specific functions and settings with your preferences.

--Display related settings.
state.DisplayMode.value = true --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the numbers if you want to move the display to a custom location.
displayx = 10
displayy = 1422

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)


--Global gear
gear.melee_herc_body = {name="Herculean Vest", augments={'Accuracy+22','"Triple Atk."+2','Attack+5',}}
gear.valor_multi_head = {name="Valorous Mask", augments={'Accuracy+14','"Dbl.Atk."+2','STR+8','Attack+15',}}
gear.valor_multi_body = {name="Valorous Mail", augments={'Attack+14','"Dbl.Atk."+5','STR+8',}}
gear.valor_multi_hands = {name="Valorous Mitts", augments={'Accuracy+11 Attack+11','"Dbl.Atk."+2','DEX+9','Accuracy+13','Attack+14',}}
gear.valor_multi_legs = {name="Valor. Hose", augments={'Attack+13','"Dbl.Atk."+3','DEX+2',}}
gear.valor_wsd_head = {name="Valorous Mask", augments={'Attack+24','Weapon skill damage +5%','Accuracy+13',}}
gear.valor_wsd_hands = {name="Valorous Mitts", augments={'Accuracy+24 Attack+24','Weapon skill damage +3%','VIT+5','Accuracy+11','Attack+1',}}
gear.valor_wsd_feet = { name="Valorous Greaves", augments={'Attack+28','Weapon skill damage +4%','STR+7','Accuracy+3',}}

--Extra user functions to change how gearswap functions across jobs.
--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-food mode on and off.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c toggle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Allows automatic weaponskilling if the job is setup to handle it.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind ^o fillmode') --Lets you see through walls.

-- Multibox commands
send_command('bind ^m send @all /mount Spheroid')
send_command('bind !m send @all /dismount')
send_command('bind ^f send @others .follow xavikon')
send_command('bind !i send @others /tell xavikon inv')

NotifyBuffs = S{'doom','petrification'}

--Usable item binds.
--Capacity item binds.
send_command('bind ^@!z get "Mecisto. Mantle" satchel;get "Capacity Ring" satchel;wait 1;get "Trizek Ring" satchel;wait 1;get "Vocation Ring" satchel;wait 1;get "Facility Ring" satchel')
send_command('bind ^!z put "Mecisto. Mantle" satchel;put "Capacity Ring" satchel;wait 1;put "Trizek Ring" satchel;wait 1;put "Vocation Ring" satchel;wait 1;put "Facility Ring" satchel')
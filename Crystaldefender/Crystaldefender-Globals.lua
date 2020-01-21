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
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind @pause gs c toggle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
--TODO: Implement AutoIndi and AutoGeo modes
send_command('bind !pause gs c cycle IndiSpell') -- Changes the IndiSpell that is automatically used
send_command('bind ^pause gs c cycle GeoSpell') -- Changes the GeoSpell that is automatically used
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Allows automatic weaponskilling if the job is setup to handle it.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
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
send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind ^m input /mount Crawler')
send_command('bind !m input /dismount')

NotifyBuffs = S{'doom','petrification'}

--Usable item binds.

--Capacity item binds.
send_command('bind ^@!z get get "Capacity Ring" satchel;wait 1;get "Trizek Ring" satchel;wait 1;get "Vocation Ring" satchel;wait 1;get "Facility Ring" satchel')
send_command('bind ^!z put put "Capacity Ring" satchel;wait 1;put "Trizek Ring" satchel;wait 1;put "Vocation Ring" satchel;wait 1;put "Facility Ring" satchel')




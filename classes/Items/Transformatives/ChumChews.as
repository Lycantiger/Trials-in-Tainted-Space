package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;

	/**
	 *
	 * @author Lycantiger
	 */
	public class ChumChews extends ItemSlotClass
	{
		private var counter:int = 0;
		private var options:Array = [];
		
		public function ChumChews(dataObject:Object=null)
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Chum Chews";
			//Regular name
			this.longName = "bag of Chum Chews";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bag of 'Chum Chews'";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Originally designed for underwater exploration of planets without extra equipment, this colorful bag of what looks like gummy fish is designed to give aquatic aspects to those who consume it, namely those of sharks. On the label is a red shark-girl with a speech bubble saying, 'A FAT FREE GENE-MOD'";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			counter = 0;
			options = [];
			clearOutput();
			if(target is PlayerCharacter) {
				if (kGAMECLASS.flags["CHUM_CHEWS"] == undefined)
				{
					kGAMECLASS.flags["CHUM_CHEWS"] = 1;
					output("You open the bag and take one of the fish-shaped candies. You pop it in your mouth and  chew...  and chew... and chew... before you're able to swallow the piece of candy. Tastes sort of like cherries with a hint of fish oil. You go and swallow the rest of the candies without chewing.");
				}
				else if (target.faceType == GLOBAL.TYPE_SHARK) output("You open the bag and pop a candy in your mouth. Thanks to your rows of sharp teeth, chewing the candy isn’t a problem. You go ahead and eat the rest of the gummies. Tastes a lot more fishy now.");
				else output("You open the bag and pop a candy in your mouth. They’re still really hard to chew. After swallowing the first, you go ahead and eat the rest of the gummies without chewing.");
				kGAMECLASS.flags["CHUM_CHEWS"]++;
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " eats a Chum Chew, but nothing happens.");
			}
			return false;
		}
	}
}
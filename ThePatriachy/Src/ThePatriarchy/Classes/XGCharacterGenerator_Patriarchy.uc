
class XGCharacterGenerator_Patriarchy extends XGCharacterGenerator dependson(X2StrategyGameRulesetDataStructures) config(ThePatriarchy);

var config int PERCENT_MALE;

function TSoldier CreateTSoldier( optional name CharacterTemplateName, optional EGender eForceGender, optional name nmCountry = '', optional int iRace = -1, optional name ArmorName )
{
    if(eForceGender == eGender_None)
    {
		//default to 80% if user inputs crazy values
		if (PERCENT_MALE < 0 || PERCENT_MALE > 100)
		{
			PERCENT_MALE = 80;
		}

		if( Rand(100) <= (PERCENT_MALE - 1))
		{
			eForceGender = eGender_Male;
		}
		else
		{
			eForceGender = eGender_Female;
		}
    }

    return Super.CreateTSoldier(CharacterTemplateName, eForceGender, nmCountry, iRace, ArmorName);
}


///@function scr_attack_get_type_relation(type, type_to_compare)
///@description compare the passed type to the other passed type to get the strength relation of the first type
function scr_attack_get_type_relation(type, type_to_compare) {
	switch(type)
	{
		case combat_type.brutal:
			switch(type_to_compare)
			{	
				case combat_type.brutal:
					return combat_relation.normal;
				case combat_type.swift:
					return combat_relation.weak;
				case combat_type.stalwart:
					return combat_relation.normal;
			}
		case combat_type.swift:
			switch(type_to_compare)
			{	
				case combat_type.brutal:
					return combat_relation.normal;
				case combat_type.swift:
					return combat_relation.normal;
				case combat_type.stalwart:
					return combat_relation.weak;
			}
		case combat_type.stalwart:
			switch(type_to_compare)
			{	
				case combat_type.brutal:
					return combat_relation.weak;
				case combat_type.swift:
					return combat_relation.normal;
				case combat_type.stalwart:
					return combat_relation.normal;
			}
	}


}

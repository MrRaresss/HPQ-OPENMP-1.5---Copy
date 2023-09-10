
/*
	*** v1.1.3 ***
	*	BIGINT FOR SAMP!
	*
	*   Creator: HPQ123 (HPQ123#8114 discord)
	*
*/

#if !defined int64_include
	#define int64_include
#else
	#endinput
#endif

new bStr[32];																										

#define BigInt:%1; 					eBit:Int64@%1,eBit:Int32@%1;

#define new_long_int_
#define BT:<%1>						Int64@%1,Int32@%1		

#define int64.%0(%1)	 			long_%0(%1)
#define int32.%0(%1) 				short_%0(%1)
#define cell1024 					1000000000		
#define int:						#
						

// for 64 biti					
#if defined _INC_SSCANF
	#define long_IsInt(%0) 			!sscanf(%0,"{i}")
#else 
	#define long_IsInt(%0) 			!validInt(%0)
	stock validInt(const int[], i=-1) {																									
		if(int[0]=='-') ++i;																			
		while(((int[++i]-('0'+cellmin))<(':'-('0'+cellmin)))) continue;									
		return int[i];																										
	}
#endif
#define long_formatNum(%1) 			formatBytes(BT:<%1>)		
#define long_value(%1)				stringBytes(BT:<%1>)
#define long_if(%1,%2,%3) 			if(OPByte(BT:<%1>,#%2,%3))		

#define long_add(%1,%2) 			extractBytes(BT:<%1>,%2)			
#define long_set(%1,%2) 			int32.set(%1,0),extractBytes(BT:<%1>,%2)			


#define short_set(%1,%2) 			Int64@%1=eBit:0,Int32@%1=eBit:%2												
#define short_add(%1,%2) 			whereBytes(BT:<%1>,%2)
#define short_value(%1) 			bytes32(BT:<%1>)
#define short_IsInt 				long_IsInt

stock whereBytes(&eBit:a,&eBit:b,value) {				
	if(value<0) {			
		value=-value;													
		a = a - eBit:(value / cell1024);																									
		if(a && b < eBit:cell1024) b = eBit:((_:b + cell1024) - (value % cell1024)), --a; else b = eBit:(_:b - (value % cell1024));					
		if(_:b > (cell1024-1)) ++a,b -= eBit:cell1024;					
	} else a = a + eBit:((_:b + value) / cell1024), b = eBit:((_:b + value) % cell1024);
	return 1;																												
}

		
stock bytes32(eBit:a,eBit:b) {														                                                                                                                          
	switch(_:a) { 																													                                                                                                                       
		case -1..1: return (_:a * cell1024) + _:b; 								
		case -2: 	return _:b > cellmax%cell1024 ? -cellmax : -((_:a * cell1024) + _:b);		                                                                                                                       
		case 2: 	return _:b > cellmax%cell1024 ? cellmax : ((_:a * cell1024) + _:b);							                                                                                                                       
		default: 	return _:a > -1 ? cellmax : -cellmax; 																                                                                                                                          						
	}																														                                                                                                                       
	return 0;																												                                                                                                                       
}																													                                                                                                                       
stock extractBytes(&eBit:a,&eBit:b,const value[],l=-1,val=0) {                                                                                                                       
	if(value[0] == '-') {                                                                                                                       
		if((l=strmid(bStr, value, 0, 21)) > 10) {                                                                                                                       
			val = strval(bStr[(l = l - 9)]), bStr[l] = '\0';	     
			a = a + eBit:strval(bStr);                                                                                                                                                                                                                                                    
			whereBytes(a, b, _:a>-1?-val:val);   
			return 1;                                                                                     
		}                                                                                                                       
		whereBytes(a, b, _:a>-1?strval(bStr):-val);                                                                                                                   
	} else {                                                                                                                       
		if((l=strmid(bStr, value, 0, 20)) > 9) {                                                                                                                       
			b = b + eBit:strval(bStr[(l = l - 9)]), bStr[l] = '\0';														
			a = a + eBit:strval(bStr);	
			return 1;																			
		}																													
		b = b + eBit:strval(bStr);																			
	}	
	return 1;																													
}																																																				
stock OPByte(eBit:bOP1,eBit:OP1,const oper[],const oper2[],eBit:bVal=eBit:0, eBit:Val=eBit:0) {																												
	extractBytes(bVal,Val,oper2);																								
	switch(oper[0]+oper[1]) {																											
		case '='+'=': return bOP1==bVal&&OP1==Val;											
		case '>'+'=': return (bOP1>bVal||(bOP1==bVal&&OP1>Val))||bOP1==bVal&&OP1==Val;															
		case '<'+'=': return (bVal>bOP1||(bOP1==bVal&&Val>OP1))||bOP1==bVal&&OP1==Val;								
		case '!'+'=': return !(bOP1==bVal&&OP1==Val);																						
		case '<': return bVal>bOP1||(bOP1==bVal&&Val>OP1);																											
		case '>': return bOP1>bVal||(bOP1==bVal&&OP1>Val);																												
		default: {																								
			#if defined PrintBacktrace																					
				PrintBacktrace();																					
			#else																								
				printf("[BigInt ERROR] Invalid operator '%s'!", oper);												
			#endif																								
		}																										
	}																											
	return false;																								
}																																	
stock stringBytes(eBit:a,eBit:b) {
	if(!a) return format(bStr,sizeof bStr,"%d", _:b), bStr;
	return format(bStr,sizeof bStr,"%d%09d", _:a,_:b), bStr;																										
}

stock formatBytes(eBit:a,eBit:b, const chars[] = ".", l=-1) {													
	stringBytes(a,b),l=strlen(bStr);																			
    while((l = l - 3) > 0) strins(bStr, chars, l);																	
    return bStr;																											
}																																																												
#if defined cache_get_value_name																							
	#define long_cache(%1,%2,%3) (int32.set(%1,0),cache_get_value_name(%2,%3,bStr)&&extractBytes(BT:<%1>,bStr))																												
#endif																														
#if defined cache_get_field_content																							
	#define long_cache(%1,%2,%3) (int32.set(%1,0),cache_get_field_content(%2,%3,bStr)&&extractBytes(BT:<%1>,bStr))																																																															
#endif 																														
#if defined long_cache && !defined cache_get_value_name && !defined cache_get_field_content
	#error The function you are using does not match mysql													
#endif																															
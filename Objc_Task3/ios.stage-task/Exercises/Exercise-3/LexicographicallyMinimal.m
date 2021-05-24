#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString * result = [[NSMutableString alloc] init];
    NSMutableString * str1 = [NSMutableString stringWithString: string1] ;
    NSMutableString * str2 = [NSMutableString stringWithString:string2];
    while ([str1 length] > 0 && [str2 length] > 0) {
        if ([str1 characterAtIndex:0] <=  [str2 characterAtIndex:0] ){
            [result appendString:[NSString stringWithFormat:@"%c", [str1 characterAtIndex:0]]];
           
            [str1 deleteCharactersInRange:(NSMakeRange(0, 1))];
        }
        else {
            [result appendString:[NSString stringWithFormat:@"%c", [str2 characterAtIndex:0]]];
            [str2 deleteCharactersInRange:(NSMakeRange(0, 1))];
        }
    }
    [result appendString:str1];
    [result appendString:str2];
    
    
    return result;
}

@end

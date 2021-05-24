#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if ([ratingArray count] < 3) {
        return 0;
    }
    NSMutableArray * temp = [[NSMutableArray alloc]init];
    NSMutableArray * result = [[NSMutableArray alloc]init];
    for (int i = 0; i <= [ratingArray count] - 3; i++) {
        for (int j = i + 1; j <= [ratingArray count] - 2; j++) {
            for (int k = j + 1; k <= [ratingArray count] - 1; k++) {
                NSArray * arr = @[[ratingArray objectAtIndex:i],[ratingArray objectAtIndex:j],[ratingArray objectAtIndex:k]];
                [temp addObject: arr];
            }
        }
    }
    for (NSArray<NSNumber*> * arr in temp) {
        NSArray * sorted = [arr sortedArrayUsingSelector:@selector(compare:)];
        if ([arr isEqualToArray: sorted] || [[[arr reverseObjectEnumerator]allObjects] isEqualToArray:sorted]) {
            [result addObject:arr];
        }
    }
    return [result count];
}

@end

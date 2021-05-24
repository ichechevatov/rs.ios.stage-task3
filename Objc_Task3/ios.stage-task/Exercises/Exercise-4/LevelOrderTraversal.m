#import "LevelOrderTraversal.h"
void traverse(NSArray * tree, NSMutableArray<NSMutableArray *> * result, NSUInteger * index, NSUInteger * level);

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray * result = [[NSMutableArray alloc] init];
    NSUInteger  index = 0;
    NSUInteger  level = 0;
    traverse(tree, result, &index, &level);
    
    return result;
}

void traverse(NSArray * tree, NSMutableArray<NSMutableArray *> * result, NSUInteger * index, NSUInteger * level){
    if ([tree count] > *index){
        if ([tree objectAtIndex: *index] != [NSNull null]) {
            NSNumber * tempNumber = [tree objectAtIndex: * index];
            
            if ([result count] <=  *level) {
                NSMutableArray * temp = [[NSMutableArray alloc]init];
                [temp addObject: tempNumber];
                [result addObject:temp];
            }else{
                [[result objectAtIndex: *level] addObject: tempNumber];
            }
            
            if ([tree count] > *index +1 && [tree objectAtIndex: *index + 1 ] != [NSNull null]) {
                *index += 1;
                *level += 1;
                traverse(tree, result, index, level);
            }
            else{*index += 1;}
            if ([tree count]> *index +1  && [tree objectAtIndex: *index + 1 ] != [NSNull null]) {
                *index += 1;
                *level += 1;
                traverse(tree, result, index, level);
            }else{*index += 1;}
        }
        *level -= 1;
    }
}


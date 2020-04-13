#import "ArrayCalculator.h"

#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *inputArray = [NSMutableArray new];
    NSMutableArray *positiveNumbers = [NSMutableArray new];
    NSMutableArray *negativeNumbers = [NSMutableArray new];
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass: [NSNumber class]]) {
            [inputArray addObject:array[i]];
                if ([array[i] intValue] < 0) {
                    [negativeNumbers addObject:array[i]];
                }
                [positiveNumbers addObject:array[i]];
        }
    }
    
    int result = 1;
    NSInteger countOfProduct = numberOfItems;
    
    NSInteger countOfElement = [inputArray count];
    
    if (countOfElement == 0) {
       
        return 0;
    }
    
    if (numberOfItems > countOfElement) {
        countOfProduct = countOfElement;
    }
    
    
    
    
    NSUInteger countOfNegative = negativeNumbers.count;
    NSUInteger countOfPositive = positiveNumbers.count;
    
    if (countOfNegative == 1 && countOfPositive == 1) {
        NSNumber *first = negativeNumbers[0];
        NSNumber *second = positiveNumbers[0];
        
        int value = [first intValue] * [second intValue];
        
        result*=value;
        
    }
    
    
    while (countOfProduct > 1 && countOfNegative > 1 ) {
        NSNumber *maxNumber = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index = [positiveNumbers indexOfObject:maxNumber];
        [positiveNumbers removeObjectAtIndex:index];
        
        NSNumber *maxNumber2 = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index2 = [positiveNumbers indexOfObject:maxNumber2];
        [positiveNumbers removeObjectAtIndex:index2];
        
        int maxPositiveValue = [maxNumber intValue] * [maxNumber2 intValue];
        
        
        NSNumber *minNumber = [negativeNumbers valueForKeyPath:@"@min.self"];
        NSUInteger minIndex = [negativeNumbers indexOfObject:minNumber];
        [negativeNumbers removeObjectAtIndex:minIndex];
            
        NSNumber *minNumber2 = [negativeNumbers valueForKeyPath:@"@min.self"];
        NSUInteger minIndex2 = [negativeNumbers indexOfObject:minNumber2];
        [negativeNumbers removeObjectAtIndex:minIndex2];
            
        int maxNegativeValue = [minNumber intValue] * [minNumber2 intValue];
            
        if (maxPositiveValue > maxNegativeValue) {
            result *= maxPositiveValue;
            [negativeNumbers addObject:minNumber];
            [negativeNumbers addObject:minNumber2];
            countOfProduct -= 2;
        } else {
            result *= maxNegativeValue;
            [positiveNumbers addObject:maxNumber];
            [positiveNumbers addObject:maxNumber2];
            countOfProduct -= 2;
            countOfNegative -= 2;
        }
    }
    
    while (countOfProduct > 0) {
        NSNumber *maxNumber = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index = [positiveNumbers indexOfObject:maxNumber];
        [positiveNumbers removeObjectAtIndex:index];
        
        result *=  [maxNumber intValue];
        countOfProduct -= 1;
    }
    
    
    return result;
}
@end


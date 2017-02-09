//
//  Corriere.m
//  8febbraioStoccaggio
//
//  Created by Maurizio on 08/02/17.
//  Copyright © 2017 Maurizio. All rights reserved.
//

#import "Corriere.h"

@implementation Corriere

-(id)initWithVolume:(NSInteger)volume carico:(NSInteger)carico{
    self = [super init];
    //controllo se il costruttore padre ha allocato il mio progetto
    if (self) {
        _volume = volume;
        _carico = carico;
    }
    
    return self;
}


#pragma mark - Override

-(NSString *) description {
    NSString *newDescription = [NSString stringWithFormat:@"%@\n Volume: %li cm3\n Carico: %li kg ", [super description], self.volume, self.carico/1000];
    
    return newDescription;

}

@end

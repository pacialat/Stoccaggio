//
//  Corriere.h
//  8febbraioStoccaggio
//
//  Created by Maurizio on 08/02/17.
//  Copyright © 2017 Maurizio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Corriere : NSObject

//Inizializer (costruttore)
-(id)initWithVolume:(NSInteger)volume carico:(NSInteger)carico;


@property (nonatomic, readonly) NSInteger volume;
@property (nonatomic, readonly) NSInteger carico;
@end

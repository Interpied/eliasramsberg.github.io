# -*- coding: utf-8 -*-
"""
Created on Sat Sep 17 15:23:43 2022

@author: elias
"""

import random

import cassiopeia as cass

cass.set_riot_api_key("RGAPI-d9bede90-a4d1-4ca4-89aa-13a1930e2052")  # This overrides the value set in your configuration/settings.
# cass.set_default_region("EUW")

summoner = cass.get_summoner(name="shacodiff", region="EUW")
print("{name} is a level {level} summoner on the {region} server.".format(name=summoner.name,
                                                                          level=summoner.level,
                                                                          region=summoner.region))

champions = cass.get_champions("EUW")
random_champion = random.choice(champions)
print("He enjoys playing champions such as {name}.".format(name=random_champion.name))

challenger_league = cass.get_challenger_league(queue=cass.Queue.ranked_solo_fives, region="EUW")
best_na = challenger_league[0].summoner
print("He's not as good as {name} at League, but probably a better python programmer!".format(name=best_na.name))

items = cass.get_items("EUW")
doubleMe x = x + x
doubleUs x y = 2*x + 2*y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1 

conanO'Brien = "It's a-me, Conan O'Brien!" 

comprehension = [x*2|x<-[1..20]]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]  

nouns = ["hobo","frog","pope"] 

adjectives = ["lazy","grouchy","scheming"]

adjectiveAndNoun = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

length' xs = sum[1|_<-xs]

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]

res = [ [ x | x <- xs, even x ] | xs <- xxs]
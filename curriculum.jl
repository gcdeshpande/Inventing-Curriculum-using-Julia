using TextAnalysis
using WordTokenizers
using Languages

#mystr = """The best error message is the one that never shows up.
#You Learn More From Failure Than From Success. 
#The purpose of software engineering is to control complexity, not to create it"""


#strDoc=StringDocument(mystr)

filepath="dataset.txt"

fd=FileDocument(filepath)
tokens_list=lowercase.(tokens(fd))
#tokens_list=replace.(tokens_list1, r"[,;]"=> "")


#println(tokens_list)
stopwords_list=stopwords(Languages.English())
articles_list=articles(Languages.English())
prepositions_list=prepositions(Languages.English())
pronouns_list=pronouns(Languages.English())
punctuation_list=[",",";","?","\"","\'","!",".","-","/","&",":"]
number_list=["0","1","2","3","4","5","6","7","8","9"]
words_list=["fresher", "candidate", "inr", "graduation", "qualificiation", "experience", "annual", "lac", "hiring", "understanding", "convert", "candidates", "qualifications"]


for word in words_list
    filter!(x->x≠word,tokens_list)
end



for num  in number_list
    filter!(x->x≠num,tokens_list)
end



for punctuationmark in punctuation_list
    filter!(x->x≠punctuationmark,tokens_list)
end


for stopword in stopwords_list
    filter!(x->x≠stopword,tokens_list)
end

for article in articles_list
    filter!(x->x≠article,tokens_list)
end


for preposition in prepositions_list
    filter!(x->x≠preposition,tokens_list)
end

for pronoun in pronouns_list
    filter!(x->x≠pronoun,tokens_list)
end


#println(tokens_list)
#tokens_list=tokens(fd)

language(fd)

td=TokenDocument(tokens_list)

ngd1=ngrams(td)
ngd2=ngrams(td, 2)
ngd3=ngrams(td, 3)


gram=ngd1
bigram=ngd2
trigram=ngd3

#println(gram)
#println()
#println(bigram)
#println()
#println(trigram)

gramd=NGramDocument(gram)
bigramd=NGramDocument(bigram)
trigramd=NGramDocument(trigram)

#println(gramd)
println()
#println(bigram)

sortedDict=sort(collect(gram), by=x->x[2], rev=true)
println(sortedDict)


sortedDict2=sort(collect(bigram), by=x->x[2], rev=true)
println(sortedDict2)


#sortedDict3=sort(collect(trigram), by=x->x[2], rev=true)
#println(sortedDict3)


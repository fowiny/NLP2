#!/bin/sh
###### Train the models
crf_learn templates/template_lemmaBigram data/NLSPARQL.train.data models/model_lemmaBigram
crf_learn templates/template_lemmaTrigram data/NLSPARQL.train.data models/model_lemmaTrigram
crf_learn templates/template_lemmaUnigram data/NLSPARQL.train.data models/model_lemmaUnigram

crf_learn templates/template_lemmaWordBigram data/NLSPARQL.train.data models/model_lemmaWordBigram
crf_learn templates/template_lemmaWordTrigram data/NLSPARQL.train.data models/model_lemmaWordTrigram
crf_learn templates/template_lemmaWordUnigram data/NLSPARQL.train.data models/model_lemmaWordUnigram

crf_learn templates/template_posBigram data/NLSPARQL.train.data models/model_posBigram
crf_learn templates/template_posTrigram data/NLSPARQL.train.data models/model_posTrigram
crf_learn templates/template_posUnigram data/NLSPARQL.train.data models/model_posUnigram

crf_learn templates/template_posWordBigram data/NLSPARQL.train.data models/model_posWordBigram
crf_learn templates/template_posWordTrigram data/NLSPARQL.train.data models/model_posWordTrigram
crf_learn templates/template_posWordUnigram data/NLSPARQL.train.data models/model_posWordUnigram

crf_learn templates/template_wordBigram data/NLSPARQL.train.data models/model_wordBigram
crf_learn templates/template_wordTrigram data/NLSPARQL.train.data models/model_wordTrigram
crf_learn templates/template_wordUnigram data/NLSPARQL.train.data models/model_wordUnigram

crf_learn templates/template_allFeaturesBigram data/NLSPARQL.train.data models/model_allFeaturesBigram
crf_learn templates/template_allFeaturesTrigram data/NLSPARQL.train.data models/model_allFeaturesTrigram
crf_learn templates/template_allFeaturesUnigram data/NLSPARQL.train.data models/model_allFeaturesUnigram

##### Test the model with test set
crf_test -m models/model_lemmaBigram data/NLSPARQL.test.data > testOutput/output_lemmaBigram
crf_test -m models/model_lemmaTrigram data/NLSPARQL.test.data > testOutput/output_lemmaTrigram
crf_test -m models/model_lemmaUnigram data/NLSPARQL.test.data > testOutput/output_lemmaUnigram

crf_test -m models/model_lemmaWordBigram data/NLSPARQL.test.data > testOutput/output_lemmaWordBigram
crf_test -m models/model_lemmaWordTrigram data/NLSPARQL.test.data > testOutput/output_lemmaWordTrigram
crf_test -m models/model_lemmaWordUnigram data/NLSPARQL.test.data > testOutput/output_lemmaWordUnigram

crf_test -m models/model_posBigram data/NLSPARQL.test.data > testOutput/output_posBigram
crf_test -m models/model_posTrigram data/NLSPARQL.test.data > testOutput/output_posTrigram
crf_test -m models/model_posUnigram data/NLSPARQL.test.data > testOutput/output_posUnigram

crf_test -m models/model_posWordBigram data/NLSPARQL.test.data > testOutput/output_posWordBigram
crf_test -m models/model_posWordTrigram data/NLSPARQL.test.data > testOutput/output_posWordTrigram
crf_test -m models/model_posWordUnigram data/NLSPARQL.test.data > testOutput/output_posWordUnigram

crf_test -m models/model_wordBigram data/NLSPARQL.test.data > testOutput/output_wordBigram
crf_test -m models/model_wordTrigram data/NLSPARQL.test.data > testOutput/output_wordTrigram
crf_test -m models/model_wordUnigram data/NLSPARQL.test.data > testOutput/output_wordUnigram

crf_test -m models/model_allFeaturesBigram data/NLSPARQL.test.data > testOutput/output_allFeaturesBigram
crf_test -m models/model_allFeaturesTrigram data/NLSPARQL.test.data > testOutput/output_allFeaturesTrigram
crf_test -m models/model_allFeaturesUnigram data/NLSPARQL.test.data > testOutput/output_allFeaturesUnigram


######## format the above output inorder to be evaluated
awk '{print $1,$4,$5}' <testOutput/output_lemmaBigram> testOutput/output_lemmaBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_lemmaTrigram> testOutput/output_lemmaTrigram.txt
awk '{print $1,$4,$5}' <testOutput/output_lemmaUnigram> testOutput/output_lemmaUnigram.txt

awk '{print $1,$4,$5}' <testOutput/output_lemmaWordBigram> testOutput/output_lemmaWordBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_lemmaWordTrigram> testOutput/output_lemmaWordTrigram.txt
awk '{print $1,$4,$5}' <testOutput/output_lemmaWordUnigram> testOutput/output_lemmaWordUnigram.txt

awk '{print $1,$4,$5}' <testOutput/output_posBigram> testOutput/output_posBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_posTrigram> testOutput/output_posTrigram.txt
awk '{print $1,$4,$5}' <testOutput/output_posUnigram> testOutput/output_posUnigram.txt

awk '{print $1,$4,$5}' <testOutput/output_posWordBigram> testOutput/output_posWordBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_posWordTrigram> testOutput/output_posWordTrigram.txt
awk '{print $1,$4,$5}' <testOutput/output_posWordUnigram> testOutput/output_posWordUnigram.txt

awk '{print $1,$4,$5}' <testOutput/output_wordBigram> testOutput/output_wordBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_wordUnigram> testOutput/output_wordUnigram.txt
awk '{print $1,$4,$5}' <testOutput/output_wordTrigram> testOutput/output_wordTrigram.txt

awk '{print $1,$4,$5}' <testOutput/output_allFeaturesBigram> testOutput/output_allFeaturesBigram.txt
awk '{print $1,$4,$5}' <testOutput/output_allFeaturesUnigram> testOutput/output_allFeaturesUnigram.txt
awk '{print $1,$4,$5}' <testOutput/output_allFeaturesTrigram> testOutput/output_allFeaturesTrigram.txt


##### Perform evaluation on the above formatted output file
perl conlleval.pl -o "\t" <testOutput/output_lemmaBigram.txt> evaluations/eval_lemmaBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_lemmaTrigram.txt> evaluations/eval_lemmaTrigram.txt
perl conlleval.pl -o "\t" <testOutput/output_lemmaUnigram.txt> evaluations/eval_lemmaUnigram.txt

perl conlleval.pl -o "\t" <testOutput/output_lemmaWordBigram.txt> evaluations/eval_lemmaWordBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_lemmaWordTrigram.txt> evaluations/eval_lemmaWordTrigram.txt
perl conlleval.pl -o "\t" <testOutput/output_lemmaWordUnigram.txt> evaluations/eval_lemmaWordUnigram.txt

perl conlleval.pl -o "\t" <testOutput/output_posBigram.txt> evaluations/eval_posBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_posTrigram.txt> evaluations/eval_posTrigram.txt
perl conlleval.pl -o "\t" <testOutput/output_posUnigram.txt> evaluations/eval_posUnigram.txt

perl conlleval.pl -o "\t" <testOutput/output_posWordBigram.txt> evaluations/eval_posWordBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_posWordTrigram.txt> evaluations/eval_posWordTrigram.txt
perl conlleval.pl -o "\t" <testOutput/output_posWordUnigram.txt> evaluations/eval_posWordUnigram.txt

perl conlleval.pl -o "\t" <testOutput/output_wordBigram.txt> evaluations/eval_wordBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_wordUnigram.txt> evaluations/eval_wordUnigram.txt
perl conlleval.pl -o "\t" <testOutput/output_wordTrigram.txt> evaluations/eval_wordTrigram.txt

perl conlleval.pl -o "\t" <testOutput/output_allFeaturesBigram.txt> evaluations/eval_allFeaturesBigram.txt
perl conlleval.pl -o "\t" <testOutput/output_allFeaturesUnigram.txt> evaluations/eval_allFeaturesUnigram.txt
perl conlleval.pl -o "\t" <testOutput/output_allFeaturesTrigram.txt> evaluations/eval_allFeaturesTrigram.txt


###############   Analysis w.r.t. the additional features of prefixes and suffixes ###############################
crf_learn templates/template_ALLFEATURESBIGRAM data/train.data models/model_ALLFEATURESBIGRAM
crf_test -m models/model_ALLFEATURESBIGRAM data/test.data > testOutput/output_ALLFEATURESBIGRAM
awk '{print $1,$13,$14}' <testOutput/output_ALLFEATURESBIGRAM> testOutput/output_ALLFEATURESBIGRAM.txt
perl conlleval.pl -o "\t" <testOutput/output_ALLFEATURESBIGRAM.txt> evaluations/eval_ALLFEATURESBIGRAM.txt

crf_learn templates/template_ALLFEATURESUNIGRAM data/train.data models/model_ALLFEATURESUNIGRAM
crf_test -m models/model_ALLFEATURESUNIGRAM data/test.data > testOutput/output_ALLFEATURESUNIGRAM
awk '{print $1,$13,$14}' <testOutput/output_ALLFEATURESUNIGRAM> testOutput/output_ALLFEATURESUNIGRAM.txt
perl conlleval.pl -o "\t" <testOutput/output_ALLFEATURESUNIGRAM.txt> evaluations/eval_ALLFEATURESUNIGRAM.txt


#### Using the 4 major parameters to control training condition
# crf_learn -f 3 -c 1.5 template_file train_file model_file

#### verbose level (confidece measure for each output tag)
# crf_test -v1 -m model test.data| head

####  N-best outputs
# crf_test -n 20 -m model test.data
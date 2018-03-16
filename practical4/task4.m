
%% TASK 4: SUPPORT VECTOR MACHINES
% *We used 'Command Prompt' on windows to use Support Vector Machines for
% classification.*


%{
_C:\Users\ve17aae\Desktop\libsvm-3.22\windows>svm-train -c 5 -g 0.01 -v 5
trainingset1.scale_
*
optimization finished, #iter = 162
nu = 0.335402
obj = -370.000436, rho = 1.289847
nSV = 123, nBSV = 116
*
optimization finished, #iter = 177
nu = 0.266526
obj = -311.649171, rho = 5.211743
nSV = 103, nBSV = 92
*
optimization finished, #iter = 83
nu = 0.196834
obj = -218.300311, rho = 2.841801
nSV = 74, nBSV = 65
Total nSV = 202
*
optimization finished, #iter = 183
nu = 0.367353
obj = -401.328945, rho = 1.783974
nSV = 132, nBSV = 126
*
optimization finished, #iter = 156
nu = 0.259661
obj = -291.257196, rho = 5.123057
nSV = 99, nBSV = 91
*
optimization finished, #iter = 110
nu = 0.195663
obj = -207.797544, rho = 2.438169
nSV = 72, nBSV = 66
Total nSV = 205
*
optimization finished, #iter = 148
nu = 0.352086
obj = -379.722247, rho = 1.403423
nSV = 126, nBSV = 121
*
optimization finished, #iter = 189
nu = 0.275073
obj = -312.051263, rho = 5.590569
nSV = 104, nBSV = 95
*
optimization finished, #iter = 77
nu = 0.204098
obj = -219.927601, rho = 3.091577
nSV = 74, nBSV = 67
Total nSV = 208
*
optimization finished, #iter = 173
nu = 0.356864
obj = -392.964775, rho = 1.820250
nSV = 130, nBSV = 122
*
optimization finished, #iter = 142
nu = 0.267126
obj = -302.967391, rho = 5.687023
nSV = 101, nBSV = 93
*
optimization finished, #iter = 87
nu = 0.204167
obj = -220.501084, rho = 2.948092
nSV = 75, nBSV = 66
Total nSV = 204
*
optimization finished, #iter = 219
nu = 0.357810
obj = -384.928211, rho = 1.898947
nSV = 131, nBSV = 121
*
optimization finished, #iter = 177
nu = 0.261275
obj = -299.667065, rho = 5.602235
nSV = 100, nBSV = 91
*
optimization finished, #iter = 102
nu = 0.200235
obj = -222.712295, rho = 2.870570
nSV = 75, nBSV = 66
Total nSV = 207
*Cross Validation Accuracy = 97.901%*

_C:\Users\ve17aae\Desktop\libsvm-3.22\windows>svm-train -c 5 -g 0.005 -v 5 trainingset1.scale_
*
optimization finished, #iter = 166
nu = 0.459095
obj = -538.303123, rho = 1.195103
nSV = 164, nBSV = 158
*
optimization finished, #iter = 169
nu = 0.398871
obj = -485.301827, rho = 4.655920
nSV = 151, nBSV = 143
*
optimization finished, #iter = 90
nu = 0.285265
obj = -325.954160, rho = 2.525384
nSV = 104, nBSV = 97
Total nSV = 287
*
optimization finished, #iter = 136
nu = 0.496729
obj = -586.651648, rho = 1.261533
nSV = 179, nBSV = 173
*
optimization finished, #iter = 215
nu = 0.398704
obj = -469.296697, rho = 4.970614
nSV = 150, nBSV = 142
*
optimization finished, #iter = 97
nu = 0.297378
obj = -326.401555, rho = 2.249209
nSV = 108, nBSV = 101
Total nSV = 294
*
optimization finished, #iter = 135
nu = 0.480656
obj = -560.091805, rho = 0.962368
nSV = 172, nBSV = 166
*
optimization finished, #iter = 187
nu = 0.417715
obj = -492.562871, rho = 5.102860
nSV = 154, nBSV = 148
*
optimization finished, #iter = 99
nu = 0.299855
obj = -338.724184, rho = 2.759554
nSV = 110, nBSV = 101
Total nSV = 291
*
optimization finished, #iter = 169
nu = 0.484205
obj = -571.230826, rho = 1.446649
nSV = 172, nBSV = 169
*
optimization finished, #iter = 183
nu = 0.404822
obj = -478.656457, rho = 5.219608
nSV = 151, nBSV = 144
*
optimization finished, #iter = 83
nu = 0.298510
obj = -338.750212, rho = 2.671740
nSV = 107, nBSV = 102
Total nSV = 285
*
optimization finished, #iter = 187
nu = 0.482364
obj = -567.211371, rho = 1.356565
nSV = 173, nBSV = 167
*
optimization finished, #iter = 185
nu = 0.406241
obj = -474.252594, rho = 5.282170
nSV = 151, nBSV = 144
*
optimization finished, #iter = 86
nu = 0.293642
obj = -333.085761, rho = 2.436665
nSV = 105, nBSV = 99
Total nSV = 288
*Cross Validation Accuracy = 94.3028%*

_C:\Users\ve17aae\Desktop\libsvm-3.22\windows>svm-train -c 10 -g 0.001 -v 5 trainingset1.scale_
*
optimization finished, #iter = 165
nu = 0.672162
obj = -1640.795758, rho = 0.483643
nSV = 239, nBSV = 234
*
optimization finished, #iter = 200
nu = 0.561046
obj = -1487.873813, rho = 2.687866
nSV = 208, nBSV = 203
*
optimization finished, #iter = 98
nu = 0.435115
obj = -1045.438378, rho = 1.917744
nSV = 155, nBSV = 150
Total nSV = 388
*
optimization finished, #iter = 175
nu = 0.715081
obj = -1766.358427, rho = 0.646483
nSV = 254, nBSV = 250
*
optimization finished, #iter = 156
nu = 0.571932
obj = -1477.082513, rho = 2.715601
nSV = 211, nBSV = 206
*
optimization finished, #iter = 106
nu = 0.455651
obj = -1079.711000, rho = 1.747295
nSV = 162, nBSV = 158
Total nSV = 401
*
optimization finished, #iter = 161
nu = 0.696014
obj = -1710.014595, rho = 0.443972
nSV = 247, nBSV = 243
*
optimization finished, #iter = 178
nu = 0.588746
obj = -1548.644878, rho = 2.847999
nSV = 216, nBSV = 212
*
optimization finished, #iter = 98
nu = 0.455871
obj = -1094.472870, rho = 2.036272
nSV = 162, nBSV = 157
Total nSV = 396
*
optimization finished, #iter = 219
nu = 0.702646
obj = -1729.393840, rho = 0.770517
nSV = 250, nBSV = 245
*
optimization finished, #iter = 186
nu = 0.561319
obj = -1508.615150, rho = 2.916335
nSV = 209, nBSV = 203
*
optimization finished, #iter = 110
nu = 0.446550
obj = -1077.373544, rho = 1.824875
nSV = 160, nBSV = 153
Total nSV = 395
*
optimization finished, #iter = 183
nu = 0.703022
obj = -1722.487024, rho = 0.601332
nSV = 249, nBSV = 245
*
optimization finished, #iter = 166
nu = 0.545600
obj = -1468.106207, rho = 2.775262
nSV = 202, nBSV = 197
*
optimization finished, #iter = 94
nu = 0.446818
obj = -1076.447219, rho = 1.854368
nSV = 159, nBSV = 154
Total nSV = 391
*Cross Validation Accuracy = 85.3073%*

_C:\Users\ve17aae\Desktop\libsvm-3.22\windows>svm-train -c 5 -g 0.01 trainingset1.scale trainset1.model_
*
optimization finished, #iter = 204
nu = 0.314540
obj = -421.538646, rho = 1.873802
nSV = 142, nBSV = 135
*
optimization finished, #iter = 159
nu = 0.235516
obj = -333.008497, rho = 5.817821
nSV = 111, nBSV = 103
*
optimization finished, #iter = 137
nu = 0.177886
obj = -238.880668, rho = 3.078280
nSV = 82, nBSV = 72
Total nSV = 227

C:\Users\ve17aae\Desktop\libsvm-3.22\windows>svm-predict testset1.scale trainset1.model predicted.outpu
*Accuracy = 98.1982% (327/333) (classification)*
%}
%% Result
% In this study, we observed how cost effect classification ratio by using
% 5 cross-validation folders. According to below results, the best choice
% is choosing cost as 5 and gama as 0.01 that give us %97 cross validation
% success. When we implement our model to test data, we observe %98
% accuracy. Only 6 data point misclassified out of 333 which is good.
%{
 -c 5 -g 0.01 %97
 -c 5 -g 0.005 %94
 -c 10 -g 0.001 %85
 *Accuracy = 98.1982% (327/333) (classification)*
%}


# Чтение  датасета

dataset <- read.csv(file = "Data.csv")

# Заполнение пропущенных значений

dataset$Age <- ifelse(is.na(dataset$Age),
  ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
  dataset$Age
)

dataset$Salary <- ifelse(is.na(dataset$Salary),
  ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
  dataset$Salary
)

# Кодирование категориальных признаков

dataset$Country <- factor(dataset$Country,
  levels = c("France", "Spain", "Germany"),
  labels = c(1, 2, 3)
)

dataset$Purchased <- factor(dataset$Purchased,
  levels = c("No", "Yes"),
  labels = c(0, 1)
)

# Разделение датасета на тестовую и обучающую выборки

library(caTools)

set.seed(123)

split <- sample.split(dataset$Purchased, SplitRation <- 0.8)

training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Масштабирование признаков

training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(training_set[,2:3])




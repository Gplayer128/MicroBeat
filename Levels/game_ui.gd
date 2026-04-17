extends Control

#var score: int = 0
var combo_count: int = 0

func _ready():
	Signals.IncrementScore.connect(IncrementScore)
	Signals.IncrementCombo.connect(IncrementCombo)
	Signals.ResetCombo.connect(ResetCombo)
	#Signals.IncrementErrors.connect(IncrementErrors)
	
	Global.errors = 0
	
	ResetCombo()

func IncrementScore(incr : int):
	Global.score += incr
	%ScoreLabel.text = " " + str(Global.score) + " Pontos"

func IncrementCombo():
	combo_count += 1
	%ComboLabel.text = " " + str(combo_count) + "x Combo"

func ResetCombo():
	combo_count = 0
	%ComboLabel.text = ""

#func _process(delta: float) -> void:
	#%ErrorsLabel.text = str(Global.errors) + " " + "Erros"
	
#func IncrementErrors():
	#%ErrorsLabel.text = str(Global.errors) + " " + "Erros"

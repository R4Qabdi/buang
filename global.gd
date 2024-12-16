extends Node

var settings = {
	"window" = Vector2(1280, 720),
	"fullscreen" = false,
	"scrollswitch" = true,
	"scrollzoom" = false,
	"vmaster" = 1,
	"vsfx" = 1,
	"vmusic" = 1,
}
var jenis = "normal"
var pdarah : int
var score : int=0
var jumlah : int

var mob = {
	"normal" = {
		"speed"=3500,
	},
	"sampah" = {
		"speed"=2000,
	}
}

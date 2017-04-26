require 'sinatra'
require 'sinatra/reloader' if development?

def caesar_cipher(string, factor)
	string = string.split("")
	final_string = ""
	string.each do |character|
		if character.ord == 32 
			final_string = final_string + character
		elsif character.ord >= 65 and character.ord <= 90
			character_order = character.ord + factor
			if character_order > 90
				character_order = character_order - 90 + 64
			elsif character_order < 65
				character_order = character_order + 90 - 64
			end
			final_string = final_string + character_order.chr
		elsif character.ord >= 97 and character.ord <= 122
			character_order = character.ord + factor
			if character_order > 122
				character_order = character_order - 122 + 96
			elsif character_order < 97
				character_order = character_order + 122 - 96
			end
			final_string = final_string + character_order.chr
		else
			final_string = final_string + character
		end		
	end
	# puts final_string
	return final_string
end

get '/' do	
	"Hello World!"
end


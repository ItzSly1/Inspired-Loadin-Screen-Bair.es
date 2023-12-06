lib.registerContext({
	id = 'video_menu',
	title = 'Configura la pantalla de carga a tu gusto!',
	options = {
		{
			title = 'Resetear video.',
			onSelect = function(args)
				lib.callback('core:video', false, function(check)
					exports.ba_hud:SendAlert('info', ('Resetaste el video de pantalla de carga correctamente.'), 5000)
				end, 'reset')
			end,
		},
		{
			title = 'Obtener tú video personalizado',
			onSelect = function(args)
				lib.callback('core:video', false, function(video)
					lib.setClipboard(video)
					exports.ba_hud:SendAlert('info', ('Copiaste el video de pantalla de carga correctamente.'), 5000)
				end, 'get')
			end,
		},
		{
			title = 'Personaliza tu video a gusto.',
			onSelect = function(args)
				local input = lib.inputDialog('¿Qué video desea colocar?', {
					{ type = "input", label = "Video (YouTube)", placeholder = "https://www.youtube.com/watch?v=Gzs60iBgd3E" },
				})
				if input and input[1] then
					lib.callback('core:video', false, function(check)
						exports.ba_hud:SendAlert('info', ('Cambiaste el video de pantalla de carga correctamente.'), 5000)
					end, 'update', input[1])
				end
			end,
		},
	},
})

RegisterCommand('video', function()
	lib.showContext('video_menu')
end, false)
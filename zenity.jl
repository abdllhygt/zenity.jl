#=
author: Abdullah Yiğiterol

--info              finished
--error             finished
--warning           finished
--question          finished
--notification      finished
--entry             finished
--calendar          finished
--file-selection    finished
--color-selection   finished
--scale             finished
--password          finished
--list
--progress
--text-info
--forms
--display=DISPLAY
=#

module Zenity

  t = ""
  w = false
  h = false

  function title(text)
    global t = text
  end

  function wsize(we,he)
    global w = we
    global h = he
  end

  function resetsize()
    global w = false
    global h = false
  end

  function result(command)
    try
      run(command)
      return true
    catch
      return false
    end
  end

  function readresult(command)
    try
      return chomp(readstring(command))
    catch
      return false
    end
  end

  function info(text)
    command = `zenity --info --title "$t" --text "$text"`
    if w != false
      command = `zenity --info --title "$t" --text "$text" --width=$w --height=$h`
    end
    resetsize()
    run(command)
  end

  function error(text)
    command = `zenity --error --title "$t" --text "$text"`
    if w != false
      command = `zenity --error --title "$t" --text "$text" --width=$w --height=$h`
    end
    resetsize()
    run(command)
  end

  function notification(text)
    run(`zenity --notification --title "$t" --text "$text"`)
  end

  function question(text)
    command = `zenity --question --title "$t" --text "$text"`
    if w != false
      command = `zenity --question --title "$t" --text "$text" --width=$w --height=$h`
    end
    resetsize()
    return result(command)
  end

  function entry()
    command = `zenity --entry --title "$t"`
    if w != false
      command = `zenity --entry --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function calendar()
    command = `zenity --calendar --title "$t"`
    if w != false
      command = `zenity --calendar --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function file()
    command = `zenity --file-selection --title "$t"`
    if w != false
      command = `zenity --file-selection --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function color()
    command = `zenity --color-selection --title "$t"`
    if w != false
      command = `zenity --color-selection --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function palette()
    command = `zenity --color-selection --show-palette --title "$t"`
    if w != false
      command = `zenity --color-selection --show-palette --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function scale()
    command = `zenity --scale --title "$t"`
    if w != false
      command = `zenity --scale --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

  function password()
    command = `zenity --password --title "$t"`
    if w != false
      command = `zenity --password --title "$t" --width=$w --height=$h`
    end
    resetsize()
    return readresult(command)
  end

end

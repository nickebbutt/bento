# show file extensions
registry_key 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ' do
  values [{
    name: 'HideFileExt',
    type: :dword,
    data: 0,
  }]
end

# show hidden files
registry_key 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ' do
  values [{
    name: 'Hidden',
    type: :dword,
    data: 1,
  }]
end

registry_key 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ' do
  values [{
    name: 'FullPath',
    type: :dword,
    data: 1,
  }]
end

registry_key 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ' do
  values [{
    name: 'FullPathAddress',
    type: :dword,
    data: 1,
  }]
end

# echo ==^> Disabling new network prompt
# reg add "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff"

# disable notification popups
registry_key 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ' do
  values [{
    name: 'EnableBalloonTips',
    type: :dword,
    data: 0,
  }]
end

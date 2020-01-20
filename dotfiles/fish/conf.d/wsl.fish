source (dirname (status -f))/../functions/wsl.fish


if is_wsl and test wsl_version -eq 2
   set -x DISPLAY (ip route list default | awk '{print $3}'):0
end

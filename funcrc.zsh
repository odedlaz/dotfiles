function jkill {
    jobs -l | cut -d' ' -f 4 | xargs kill -9
}

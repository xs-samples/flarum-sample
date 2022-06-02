#!/usr/bin/env bash
install() {
  docker-compose up
}

down() {
  docker-compose down
}

update() {
  echo 'Please confirm that you have changed the image version number?(Y/n):'

  read confirm

  if [[ "$confirm" == "Y" || "$confirm" == "y" ]]; then
    # Stop and remove flarum container.
    docker-compose rm -sf flarum
    # Recreate flarum container.
    docker-compose up -d flarum
    unset confirm
    echo 'Container Upgrade complete!'
  else
    echo 'Container Upgrade cancel！'
  fi
}

main() {
  COMMAND=$1
  case $COMMAND in
  install)
    install
    ;;
  down)
    down
    ;;
  update)
    update
    ;;
  *)
    echo 'Please enter the correct command!(install/update/down)'
    ;;
  esac
}

main $1

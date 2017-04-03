aws_elasticbeanstalk_available_solution_stacks_list() {
    shift 0

    log_and_run aws elasticbeanstalk list-available-solution-stacks "$@"
}

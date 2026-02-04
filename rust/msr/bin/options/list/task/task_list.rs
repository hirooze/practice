use std::fs;
use std::path::Path;

use msr::task_list_functions::load_patterns;

pub fn list_patterns() {
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let patterns = load_patterns(&pattern_file);
    for (before, after) in patterns {
        println!("{} -> {}", before, after);
    }
}
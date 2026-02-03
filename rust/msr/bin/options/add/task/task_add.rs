use std::env;
use std::path::Path;

use msr::task_add_functions::{load_patterns, save_patterns};

pub fn add_pattern() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("使用法: {} <before> <after>", args[0]);
        return;
    }
    let before = &args[1];
    let after = &args[2];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let mut patterns = load_patterns(&pattern_file);
    patterns.push((before.clone(), after.clone()));
    save_patterns(&pattern_file, &patterns);
    println!("パターンを追加しました: {} -> {}", before, after);
}
use std::env;
use std::path::Path;

use msr::task_del_functions::{load_patterns, save_patterns};

pub fn del_pattern() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("使用法: {} <before>", args[0]);
        return;
    }
    let before = &args[1];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    let mut patterns = load_patterns(&pattern_file);
    patterns.retain(|(b, _)| b != before);
    save_patterns(&pattern_file, &patterns);
    println!("パターンを削除しました: {}", before);
}
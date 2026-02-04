// 置換タスク
use std::env;
use std::fs;
use std::path::Path;

use crate::task_main_functions::{replace_with_patterns, load_patterns, save_patterns, add_pattern, del_pattern, clear_patterns, list_patterns, export_patterns, import_patterns, show_help, show_version};

pub fn perform_replace() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("使用法: {} <ファイルまたは文字列>", args[0]);
        return;
    }
    let input = &args[1];
    let config_dir = Path::new("etc");
    let pattern_file = config_dir.join("pattern.conf");
    if Path::new(input).exists() {
        let content = fs::read_to_string(input).unwrap();
        let replaced = replace_with_patterns(&content, &pattern_file);
        println!("{}", replaced);
    } else {
        let replaced = replace_with_patterns(input, &pattern_file);
        println!("{}", replaced);
    }
}

pub fn perform_replace_main(input: &str, pattern_file: &Path) {
    // ファイルか文字列か判定
    if Path::new(input).exists() {
        // ファイルの場合
        let content = fs::read_to_string(input).unwrap();
        let replaced = replace_with_patterns(&content, pattern_file);
        println!("{}", replaced);
    } else {
        // 文字列の場合
        let replaced = replace_with_patterns(input, pattern_file);
        println!("{}", replaced);
    }
}

pub fn add_pattern_main(pattern_file: &Path, before: &str, after: &str) {
    add_pattern(pattern_file, before, after);
}

pub fn del_pattern_main(pattern_file: &Path, before: &str) {
    del_pattern(pattern_file, before);
}

pub fn clear_patterns_main(pattern_file: &Path) {
    clear_patterns(pattern_file);
}

pub fn list_patterns_main(pattern_file: &Path) {
    list_patterns(pattern_file);
}

pub fn export_patterns_main(pattern_file: &Path, file: &str) {
    export_patterns(pattern_file, file);
}

pub fn import_patterns_main(pattern_file: &Path, file: &str) {
    import_patterns(pattern_file, file);
}

pub fn show_help_main() {
    show_help();
}

pub fn show_version_main() {
    show_version();
}
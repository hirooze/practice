use std::fs;
use std::path::Path;

use super::utils::{load_patterns, save_patterns};

pub fn add_pattern(pattern_file: &Path, before: &str, after: &str) {
    let mut patterns = load_patterns(pattern_file);
    patterns.push((before.to_string(), after.to_string()));
    save_patterns(pattern_file, &patterns);
    println!("パターンを追加しました: {} -> {}", before, after);
}

pub fn del_pattern(pattern_file: &Path, before: &str) {
    let mut patterns = load_patterns(pattern_file);
    patterns.retain(|(b, _)| b != before);
    save_patterns(pattern_file, &patterns);
    println!("パターンを削除しました: {}", before);
}

pub fn clear_patterns(pattern_file: &Path) {
    fs::write(pattern_file, "").unwrap();
    println!("パターンをクリアしました");
}

pub fn list_patterns(pattern_file: &Path) {
    let patterns = load_patterns(pattern_file);
    for (before, after) in patterns {
        println!("{} -> {}", before, after);
    }
}

pub fn export_patterns(pattern_file: &Path, file: &str) {
    let patterns = load_patterns(pattern_file);
    let content = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect::<Vec<_>>()
        .join("\n");
    fs::write(file, content).unwrap();
    println!("パターンを {} にエクスポートしました", file);
}

pub fn import_patterns(pattern_file: &Path, file: &str) {
    let import_content = fs::read_to_string(file).unwrap();
    let mut patterns = load_patterns(pattern_file);
    for line in import_content.lines() {
        if !line.trim().is_empty() && !line.starts_with('#') {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                patterns.push((parts[0].trim().to_string(), parts[1].trim().to_string()));
            }
        }
    }
    save_patterns(pattern_file, &patterns);
    println!("パターンを {} からインポートしました", file);
}
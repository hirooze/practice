use std::fs;
use std::path::Path;

pub fn load_patterns(pattern_file: &Path) -> Vec<(String, String)> {
    if !pattern_file.exists() {
        return vec![];
    }
    let content = fs::read_to_string(pattern_file).unwrap();
    content
        .lines()
        .filter(|line| !line.trim().is_empty() && !line.starts_with('#'))
        .map(|line| {
            let parts: Vec<&str> = line.split(',').collect();
            if parts.len() == 2 {
                (parts[0].trim().to_string(), parts[1].trim().to_string())
            } else {
                ("".to_string(), "".to_string())
            }
        })
        .collect()
}

pub fn save_patterns(pattern_file: &Path, patterns: &[(String, String)]) {
    let mut lines: Vec<String> = patterns
        .iter()
        .map(|(b, a)| format!("{},{}", b, a))
        .collect();
    lines.sort();
    lines.dedup();
    let content = lines.join("\n");
    fs::write(pattern_file, content).unwrap();
}
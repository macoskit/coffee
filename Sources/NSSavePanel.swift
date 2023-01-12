import AppKit
import UniformTypeIdentifiers

extension NSSavePanel {
    public func with(name: String) -> Self {
        nameFieldStringValue = name
        return self
    }
    
    public func with(types: [UTType]) -> Self {
        allowedContentTypes = types
        return self
    }
    
    public func save(url: URL) async -> Bool {
        guard let data = try? Data(contentsOf: url) else { return false }
        return await save(data: data)
    }
    
    public func save(data: Data) async -> Bool {
        await withUnsafeContinuation { continuation in
            begin { [weak self] response in
                guard
                    response == .OK,
                    let url = self?.url,
                    let _ = try? data.write(to: url, options: .atomic)
                else {
                    continuation.resume(returning: false)
                    return
                }
                NSWorkspace.shared.activateFileViewerSelecting([url])
                continuation.resume(returning: true)
            }
        }
    }
}

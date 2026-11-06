import SwiftBackports

#if os(macOS) || os(iOS)
import SwiftUI
#if canImport(LinkPresentation)
import LinkPresentation
#endif

@available(iOS, deprecated: 16)
@available(macOS, deprecated: 13)
@available(watchOS, deprecated: 9)
@available(tvOS, unavailable)
public extension Backport where Wrapped == Any {
    struct ShareLink<Data, PreviewImage, PreviewIcon, Label>: View where Data: RandomAccessCollection, Data.Element: Shareable, Label: View {
        @State private var activity: ActivityItem<Data>?

        let label: Label
        let data: Data
        let subject: String?
        let message: String?
        let preview: (Data.Element) -> SharePreview<PreviewImage, PreviewIcon>

        public var body: some View {
            Button {
                activity = ActivityItem(data: data)
            } label: {
                label
            }
            .shareSheet(item: $activity)
        }
    }
}
#endif

// Keep these generic initializers with their private State declaration.
// Swift 6.4 otherwise leaves its cross-file default-initialization symbol undefined.

#if os(macOS) || os(iOS)
import SwiftUI
import SwiftBackports

@available(iOS, deprecated: 16)
@available(macOS, deprecated: 13)
@available(watchOS, deprecated: 9)
@available(tvOS, unavailable)
public extension Backport.ShareLink where Wrapped == Any {
    init(item: String, subject: String? = nil, message: String? = nil)
    where Data == CollectionOfOne<String>, PreviewImage == Never, PreviewIcon == Never, Label == DefaultShareLinkLabel {
        self.label = .init()
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(item: URL, subject: String? = nil, message: String? = nil)
    where Data == CollectionOfOne<URL>, PreviewImage == Never, PreviewIcon == Never, Label == DefaultShareLinkLabel {
        self.label = .init()
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(item: String, subject: String? = nil, message: String? = nil, @ViewBuilder label: () -> Label)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<String> {
        self.label = label()
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(item: URL, subject: String? = nil, message: String? = nil, @ViewBuilder label: () -> Label)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<URL> {
        self.label = label()
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }
}
#endif

#if os(macOS) || os(iOS)
import SwiftUI
import SwiftBackports

@available(iOS, deprecated: 16)
@available(macOS, deprecated: 13)
@available(watchOS, deprecated: 9)
@available(tvOS, unavailable)
public extension Backport.ShareLink where Wrapped == Any {
    init<S: StringProtocol>(_ title: S, item: String, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<String>, Label == Text {
        self.label = Text(title)
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(_ titleKey: LocalizedStringKey, item: String, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<String>, Label == Text {
        self.label = Text(titleKey)
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(_ title: Text, item: String, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<String>, Label == Text {
        self.label = title
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init<S: StringProtocol>(_ title: S, item: URL, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<URL>, Label == Text {
        self.label = Text(title)
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(_ titleKey: LocalizedStringKey, item: URL, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<URL>, Label == Text {
        self.label = Text(titleKey)
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(_ title: Text, item: URL, subject: String? = nil, message: String? = nil)
    where PreviewIcon == Never, PreviewImage == Never, Data == CollectionOfOne<URL>, Label == Text {
        self.label = title
        self.data = .init(item)
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }
}
#endif

#if os(macOS) || os(iOS)
import SwiftUI
import SwiftBackports

@available(iOS, deprecated: 16)
@available(macOS, deprecated: 13)
@available(watchOS, deprecated: 9)
@available(tvOS, unavailable)
public extension Backport.ShareLink where Wrapped == Any {
    init(items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == String, Label == DefaultShareLinkLabel {
        self.label = .init()
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == URL, Label == DefaultShareLinkLabel {
        self.label = .init()
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(items: Data, subject: String? = nil, message: String? = nil, @ViewBuilder label: () -> Label)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == String {
        self.label = label()
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(items: Data, subject: String? = nil, message: String? = nil, @ViewBuilder label: () -> Label)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == URL {
        self.label = label()
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }
}
#endif

#if os(macOS) || os(iOS)
import SwiftUI
import SwiftBackports

@available(iOS, deprecated: 16)
@available(macOS, deprecated: 13)
@available(watchOS, deprecated: 9)
@available(tvOS, unavailable)
public extension Backport.ShareLink where Wrapped == Any {
    init<S: StringProtocol>(_ title: S, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == String, Label == DefaultShareLinkLabel {
        self.label = .init(title)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(_ titleKey: LocalizedStringKey, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == String, Label == DefaultShareLinkLabel {
        self.label = .init(titleKey)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init(_ title: Text, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == String, Label == DefaultShareLinkLabel {
        self.label = .init(title)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0) }
    }

    init<S: StringProtocol>(_ title: S, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == URL, Label == DefaultShareLinkLabel {
        self.label = .init(title)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(_ titleKey: LocalizedStringKey, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == URL, Label == DefaultShareLinkLabel {
        self.label = .init(titleKey)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }

    init(_ title: Text, items: Data, subject: String? = nil, message: String? = nil)
    where PreviewImage == Never, PreviewIcon == Never, Data.Element == URL, Label == DefaultShareLinkLabel {
        self.label = .init(title)
        self.data = items
        self.subject = subject
        self.message = message
        self.preview = { .init($0.absoluteString) }
    }
}
#endif

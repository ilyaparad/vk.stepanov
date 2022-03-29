//
//  ViewController.swift
//  vk.stepanov
//
//  Created by test on 23.03.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Elements
    // создание элементов
    private lazy var avatarImageButton: UIButton = {
        let avatarImageButton = UIButton()
        
        avatarImageButton.setImage(UIImage(named: "photo"), for: .normal)
        avatarImageButton.layer.masksToBounds = true
        avatarImageButton.layer.cornerRadius = 46
        
        return avatarImageButton
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.text = "Илья Степанов"
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 25)
        
        return nameLabel
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("Do it like a pro", for: .normal)
        statusButton.titleLabel?.textColor = .white
        statusButton.titleLabel?.font = UIFont(name: "System - System", size: 17)

        return statusButton
    }()
    
    private lazy var activityStatusLabel: UILabel = {
        let activityStatusLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: "online ")
        let iphoneImage = NSTextAttachment()
        iphoneImage.image = UIImage(systemName: "iphone")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iphoneImage.bounds = CGRect(x: 0, y: -2, width: 20, height: 20)
        attributedString.append(NSAttributedString(attachment: iphoneImage))
        activityStatusLabel.attributedText = attributedString
        activityStatusLabel.textColor = .white
        
        return activityStatusLabel
    }()
    
    private lazy var editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Редактировать", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = UIColor(rgb: 0x3b3838)
        editButton.layer.masksToBounds = true
        editButton.layer.cornerRadius = 10
        editButton.titleLabel?.font = UIFont(name: "System - System", size: 22)
        editButton.contentHorizontalAlignment = .center
        
        return editButton
    }()
    
    private lazy var addContentStackView: UIStackView = {
        let addContentStackView = UIStackView()
        
        addContentStackView.axis = .horizontal
        addContentStackView.distribution = .equalSpacing
        
        return addContentStackView
    }()
    
    private lazy var historyButton = createContentButtons(with: "История", icon: "camera")
    
    private lazy var noteButton = createContentButtons(with: "Запись", icon: "square.and.pencil")
    
    private lazy var photoButton = createContentButtons(with: "Фото", icon: "photo")
    
    private lazy var clipButton = createContentButtons(with: "Клип", icon: "play.square")
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor(rgb: 0x3b3838)
        
        return separator
    }()
    
    private lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView()
        
        infoStackView.axis = .vertical
        infoStackView.alignment = .leading
        infoStackView.distribution = .equalSpacing
        
        return infoStackView
    }()
    
    
    private lazy var cityButton = createInfoButton(with: "   Город: Самара", colorOfTitle: .systemGray, icon: "house")
    private lazy var followersButton = createInfoButton(with: "     35 подписчиков", colorOfTitle: .systemGray, icon: "dot.radiowaves.up.forward")
    private lazy var workPlaceButton = createInfoButton(with: "   Укажите место работы", colorOfTitle: UIColor(rgb: 0x78AAE3), icon: "briefcase")
    private lazy var presentButton = createInfoButton(with: "     Получить подарок", colorOfTitle: UIColor(rgb: 0x7420bd), icon: "snowflake")
    private lazy var fullInfoButton = createInfoButton(with: "    Подробная информация", colorOfTitle: .white, icon: "info.circle.fill")
    
    private lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        let mediumConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .medium, scale: .medium)
        chevron.image = UIImage(systemName: "chevron.right", withConfiguration: mediumConfig)
        chevron.tintColor = UIColor(rgb: 0x7420bd)
        
        return chevron
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchi()
        setupLayout()
        
        view.backgroundColor = UIColor(rgb: 0x19191A)
        
    }
    private func setupHierarchi() {
        view.addSubview(avatarImageButton)
        view.addSubview(nameLabel)
        view.addSubview(statusButton)
        view.addSubview(activityStatusLabel)
        view.addSubview(editButton)
        
        view.addSubview(addContentStackView)
        addContentStackView.addArrangedSubview(historyButton)
        addContentStackView.addArrangedSubview(noteButton)
        addContentStackView.addArrangedSubview(photoButton)
        addContentStackView.addArrangedSubview(clipButton)
        
        view.addSubview(separator)
        
        view.addSubview(infoStackView)
        infoStackView.addArrangedSubview(cityButton)
        infoStackView.addArrangedSubview(followersButton)
        infoStackView.addArrangedSubview(workPlaceButton)
        infoStackView.addArrangedSubview(presentButton)
        infoStackView.addArrangedSubview(fullInfoButton)
        
        view.addSubview(chevronImage)
    }

    private func setupLayout() {
        avatarImageButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        activityStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        addContentStackView.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                   constant: 50),
            avatarImageButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                    constant: 15),
            avatarImageButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                     constant: 105),
            avatarImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                      constant: 140),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 55),
            nameLabel.leftAnchor.constraint(equalTo: avatarImageButton.rightAnchor,
                                            constant: 15),
            statusButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                              constant: 0),
            statusButton.leftAnchor.constraint(equalTo: avatarImageButton.rightAnchor,
                                               constant: 15),
            activityStatusLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor,
                                                     constant: 0),
            activityStatusLabel.leftAnchor.constraint(equalTo: avatarImageButton.rightAnchor,
                                               constant: 15),
            editButton.topAnchor.constraint(equalTo: activityStatusLabel.topAnchor,
                                            constant: 45),
            editButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            editButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 420),
            editButton.bottomAnchor.constraint(equalTo: avatarImageButton.bottomAnchor, constant: 65),
            addContentStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 15),
            addContentStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            addContentStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 420),
            addContentStackView.bottomAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 65),
            separator.topAnchor.constraint(equalTo: addContentStackView.bottomAnchor, constant: 15),
            separator.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            separator.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 420),
            separator.bottomAnchor.constraint(equalTo: addContentStackView.bottomAnchor, constant: 16),
            infoStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 15),
            infoStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            infoStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 420),
            infoStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            infoStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            chevronImage.leftAnchor.constraint(equalTo: presentButton.rightAnchor, constant: 5),
            chevronImage.topAnchor.constraint(equalTo: workPlaceButton.bottomAnchor, constant: 16)
            
            
        ])
       
    }
    
    private func createContentButtons(with title: String, icon: String) -> UIButton {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        let mediumConfig = UIImage.SymbolConfiguration(weight: .medium)
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.image = UIImage(systemName: icon, withConfiguration: mediumConfig)
        configuration.imagePlacement = .top
        configuration.imagePadding = 9
        configuration.baseForegroundColor = UIColor(rgb: 0x78AAE3)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        
        return button
    }
    
    private func createInfoButton(with title: String, colorOfTitle: UIColor?, icon: String) -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitle(title, for: .normal)
        button.setImage(UIImage(systemName: icon), for: .normal)
        button.tintColor = colorOfTitle
    
        return button
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && red <= 255, "Invalid green component")
        assert(blue >= 0 && red <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF,
                  green: (rgb >> 8) & 0xFF,
                  blue: rgb & 0xFF)
    }
}

